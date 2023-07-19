extends RefCounted
#brief A class that stores an expression you can execute.
#desc An expression can be made of any arithmetic operation, built-in math function call, method call of a passed instance, or built-in type construction call.
#desc An example expression text using the built-in math functions could be [code]sqrt(pow(3, 2) + pow(4, 2))[/code].
#desc In the following example we use a [LineEdit] node to write our expression and show the result.
#desc [codeblocks]
#desc [gdscript]
#desc var expression = Expression.new()
#desc 
#desc func _ready():
#desc $LineEdit.text_submitted.connect(self._on_text_submitted)
#desc 
#desc func _on_text_submitted(command):
#desc var error = expression.parse(command)
#desc if error != OK:
#desc print(expression.get_error_text())
#desc return
#desc var result = expression.execute()
#desc if not expression.has_execute_failed():
#desc $LineEdit.text = str(result)
#desc [/gdscript]
#desc [csharp]
#desc private Expression _expression = new Expression();
#desc 
#desc public override void _Ready()
#desc {
#desc GetNode<LineEdit>("LineEdit").TextSubmitted += OnTextEntered;
#desc }
#desc 
#desc private void OnTextEntered(string command)
#desc {
#desc Error error = _expression.Parse(command);
#desc if (error != Error.Ok)
#desc {
#desc GD.Print(_expression.GetErrorText());
#desc return;
#desc }
#desc Variant result = _expression.Execute();
#desc if (!_expression.HasExecuteFailed())
#desc {
#desc GetNode<LineEdit>("LineEdit").Text = result.ToString();
#desc }
#desc }
#desc [/csharp]
#desc [/codeblocks]
#tutorial [Evaluating Expressions] https://docs.godotengine.org/en/stable/tutorials/scripting/evaluating_expressions.html
class_name Expression




#desc Executes the expression that was previously parsed by [method parse] and returns the result. Before you use the returned object, you should check if the method failed by calling [method has_execute_failed].
#desc If you defined input variables in [method parse], you can specify their values in the inputs array, in the same order.
func execute(inputs: Array = [], base_instance: Object = null, show_error: bool = true, const_calls_only: bool = false) -> Variant:
	pass;

#desc Returns the error text if [method parse] or [method execute] has failed.
func get_error_text() -> String:
	pass;

#desc Returns [code]true[/code] if [method execute] has failed.
func has_execute_failed() -> bool:
	pass;

#desc Parses the expression and returns an [enum Error] code.
#desc You can optionally specify names of variables that may appear in the expression with [param input_names], so that you can bind them when it gets executed.
func parse(expression: String, input_names: PackedStringArray = PackedStringArray()) -> int:
	pass;


