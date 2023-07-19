extends InputEvent
#brief Input event for MIDI inputs.
#desc InputEventMIDI allows receiving input events from MIDI devices such as a piano. MIDI stands for Musical Instrument Digital Interface.
#desc MIDI signals can be sent over a 5-pin MIDI connector or over USB, if your device supports both be sure to check the settings in the device to see which output it's using.
#desc To receive input events from MIDI devices, you need to call [method OS.open_midi_inputs]. You can check which devices are detected using [method OS.get_connected_midi_inputs].
#desc [codeblocks]
#desc [gdscript]
#desc func _ready():
#desc OS.open_midi_inputs()
#desc print(OS.get_connected_midi_inputs())
#desc 
#desc func _input(input_event):
#desc if input_event is InputEventMIDI:
#desc _print_midi_info(input_event)
#desc 
#desc func _print_midi_info(midi_event: InputEventMIDI):
#desc print(midi_event)
#desc print("Channel " + str(midi_event.channel))
#desc print("Message " + str(midi_event.message))
#desc print("Pitch " + str(midi_event.pitch))
#desc print("Velocity " + str(midi_event.velocity))
#desc print("Instrument " + str(midi_event.instrument))
#desc print("Pressure " + str(midi_event.pressure))
#desc print("Controller number: " + str(midi_event.controller_number))
#desc print("Controller value: " + str(midi_event.controller_value))
#desc [/gdscript]
#desc [csharp]
#desc public override void _Ready()
#desc {
#desc OS.OpenMidiInputs();
#desc GD.Print(OS.GetConnectedMidiInputs());
#desc }
#desc 
#desc public override void _Input(InputEvent @event)
#desc {
#desc if (@event is InputEventMIDI midiEvent)
#desc {
#desc PrintMIDIInfo(midiEvent);
#desc }
#desc }
#desc 
#desc private void PrintMIDIInfo(InputEventMIDI midiEvent)
#desc {
#desc GD.Print(midiEvent);
#desc GD.Print($"Channel {midiEvent.Channel}");
#desc GD.Print($"Message {midiEvent.Message}");
#desc GD.Print($"Pitch {midiEvent.Pitch}");
#desc GD.Print($"Velocity {midiEvent.Velocity}");
#desc GD.Print($"Instrument {midiEvent.Instrument}");
#desc GD.Print($"Pressure {midiEvent.Pressure}");
#desc GD.Print($"Controller number: {midiEvent.ControllerNumber}");
#desc GD.Print($"Controller value: {midiEvent.ControllerValue}");
#desc }
#desc [/csharp]
#desc [/codeblocks]
#desc Note that Godot does not currently support MIDI output, so there is no way to emit MIDI signals from Godot. Only MIDI input works.
#tutorial [MIDI Message Status Byte List] https://www.midi.org/specifications-old/item/table-2-expanded-messages-list-status-bytes
#tutorial [Wikipedia General MIDI Instrument List] https://en.wikipedia.org/wiki/General_MIDI#Program_change_events
#tutorial [Wikipedia Piano Key Frequencies List] https://en.wikipedia.org/wiki/Piano_key_frequencies#List
class_name InputEventMIDI


#desc The MIDI channel of this input event. There are 16 channels, so this value ranges from 0 to 15. MIDI channel 9 is reserved for the use with percussion instruments, the rest of the channels are for non-percussion instruments.
var channel: int:
	get = get_channel, set = set_channel

#desc If the message is [constant MIDI_MESSAGE_CONTROL_CHANGE], this indicates the controller number, otherwise this is zero. Controllers include devices such as pedals and levers.
var controller_number: int:
	get = get_controller_number, set = set_controller_number

#desc If the message is [constant MIDI_MESSAGE_CONTROL_CHANGE], this indicates the controller value, otherwise this is zero. Controllers include devices such as pedals and levers.
var controller_value: int:
	get = get_controller_value, set = set_controller_value

#desc The instrument of this input event. This value ranges from 0 to 127. Refer to the instrument list on the General MIDI wikipedia article to see a list of instruments, except that this value is 0-index, so subtract one from every number on that chart. A standard piano will have an instrument number of 0.
var instrument: int:
	get = get_instrument, set = set_instrument

#desc Returns a value indicating the type of message for this MIDI signal. This is a member of the [enum MIDIMessage] enum.
#desc For MIDI messages between 0x80 and 0xEF, only the left half of the bits are returned as this value, as the other part is the channel (ex: 0x94 becomes 0x9). For MIDI messages from 0xF0 to 0xFF, the value is returned as-is.
#desc Notes will return [constant MIDI_MESSAGE_NOTE_ON] when activated, but they might not always return [constant MIDI_MESSAGE_NOTE_OFF] when deactivated, therefore your code should treat the input as stopped if some period of time has passed.
#desc Some MIDI devices may send [constant MIDI_MESSAGE_NOTE_ON] with zero velocity instead of [constant MIDI_MESSAGE_NOTE_OFF].
#desc For more information, see the note in [member velocity] and the MIDI message status byte list chart linked above.
var message: int:
	get = get_message, set = set_message

#desc The pitch index number of this MIDI signal. This value ranges from 0 to 127. On a piano, middle C is 60, and A440 is 69, see the "MIDI note" column of the piano key frequency chart on Wikipedia for more information.
var pitch: int:
	get = get_pitch, set = set_pitch

#desc The pressure of the MIDI signal. This value ranges from 0 to 127. For many devices, this value is always zero.
var pressure: int:
	get = get_pressure, set = set_pressure

#desc The velocity of the MIDI signal. This value ranges from 0 to 127. For a piano, this corresponds to how quickly the key was pressed, and is rarely above about 110 in practice.
#desc [b]Note:[/b] Some MIDI devices may send a [constant MIDI_MESSAGE_NOTE_ON] message with zero velocity and expect this to be treated the same as a [constant MIDI_MESSAGE_NOTE_OFF] message, but device implementations vary so Godot reports event data exactly as received. Depending on the hardware and the needs of the game/app, this MIDI quirk can be handled robustly with a couple lines of script (check for [constant MIDI_MESSAGE_NOTE_ON] with velocity zero).
var velocity: int:
	get = get_velocity, set = set_velocity




func get_channel() -> int:
	return channel

func set_channel(value: int) -> void:
	channel = value

func get_controller_number() -> int:
	return controller_number

func set_controller_number(value: int) -> void:
	controller_number = value

func get_controller_value() -> int:
	return controller_value

func set_controller_value(value: int) -> void:
	controller_value = value

func get_instrument() -> int:
	return instrument

func set_instrument(value: int) -> void:
	instrument = value

func get_message() -> int:
	return message

func set_message(value: int) -> void:
	message = value

func get_pitch() -> int:
	return pitch

func set_pitch(value: int) -> void:
	pitch = value

func get_pressure() -> int:
	return pressure

func set_pressure(value: int) -> void:
	pressure = value

func get_velocity() -> int:
	return velocity

func set_velocity(value: int) -> void:
	velocity = value

