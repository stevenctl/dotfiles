#!/usr/bin/env sh

# the scripting-addition must be loaded manually if
# you are running yabai on macOS Big Sur. Uncomment
# the following line to have the injection performed
# when the config is executed during startup.
#
# for this to work you must configure sudo such that
# it will be able to run the command without password
#
# see this wiki page for information:
#  - https://github.com/koekeishiya/yabai/wiki/Installing-yabai-(latest-release)
#
# sudo yabai --load-sa
# yabai -m signal --add event=dock_did_restart action="sudo yabai --load-sa"

#!/usr/bin/env sh


# global settings
yabai -m config mouse_follows_focus          off
yabai -m config focus_follows_mouse          autofocus

yabai -m config window_placement             second_child
yabai -m config window_topmost               off

yabai -m config window_opacity               off
yabai -m config window_opacity_duration      0.0
yabai -m config window_shadow                on

yabai -m config active_window_opacity        1.0
yabai -m config normal_window_opacity        0.90
yabai -m config split_ratio                  0.50
yabai -m config auto_balance                 off

# Mouse support
yabai -m config mouse_modifier               alt
yabai -m config mouse_action1                move
yabai -m config mouse_action2                resize

# # general space settings
yabai -m config layout                       bsp
yabai -m config top_padding                  20
yabai -m config bottom_padding               20
yabai -m config left_padding                 20
yabai -m config right_padding                20
yabai -m config window_gap                   20

# float system preferences
yabai -m rule --add app='^System Information$' manage=off
yabai -m rule --add app='^System Preferences$' manage=off
yabai -m rule --add title='Preferences$' manage=off

# float settings windows
yabai -m rule --add title='Settings$' manage=off

# # Some Goland settings, in case you are using it. float Goland Preference panes
# yabai -m rule --add app='Goland IDEA' title='^$' manage=off
# yabai -m rule --add app='Goland IDEA' title='Project Structure' manage=off
# yabai -m rule --add app='Goland IDEA' title='Preferences' manage=off
# yabai -m rule --add app='Goland IDEA' title='Edit configuration' manage=off

echo "yabai configuration loaded.."
