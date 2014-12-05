# encoding: utf-8

# Start Keymando at login
# -----------------------------------------------------------
start_at_login

# Disable Keymando when using these applications
# -----------------------------------------------------------
disable "Remote Desktop Connection"
# disable /VirtualBox/

# Basic mapping
# -----------------------------------------------------------

toggle "<Cmd-0>"

except /iTerm/, /MacVim/ do
  map "<Ctrl-[>", "<Escape>"
  map "<Ctrl-m>", "<Ctrl-F2>"
  map "<Ctrl-h>", "<Left>"
  map "<Ctrl-j>", "<Down>"
  map "<Ctrl-k>", "<Up>"
  map "<Ctrl-l>", "<Right>"
  map "<Ctrl-m>", "<Tab>"
  map "<Ctrl-,>", "<Shift-Tab>"
  map "<Ctrl-n>", "<Ctrl-n>"
  map "<Ctrl-u>", "<PageUp>"
  map "<Ctrl-d>", "<PageDown>"
end

only /iTerm/ do
  map '<Cmd-w>', noop
  map '<Cmd-q>', noop
  map '<Cmd-r>', noop
end

# Application shortcuts
# -----------------------------------------------------------

map "``", "`"
map "`ai", lambda { activate('iTerm') }
map "`ae", lambda { activate('Messages') }
map "`aa", lambda { activate('Mail') }
map "`as", lambda { activate('Safari') }
map "`n", lambda { application_previous }
map "`m", lambda { application_next }

# Commands
# -----------------------------------------------------------

# Command launcher window via Cmd-Space
map "<Cmd-r>", Commands.right_click
map "<Cmd-o>", Commands.run_last_command
map "<Cmd-9>", Commands.run_registered_command
map "<Cmd-i>", Commands.run_history_item
map "<Cmd-p>", Commands.press_button_on_ui
map "<Cmd-.>", RunLastCommand.instance

map "<Cmd-d>", Commands.current_app_windows
map "<Cmd-f>", Commands.trigger_app

except /(iTerm|MacVim)/ do
  map "`uic", Commands.ui_controls
  map "`lc", Commands.left_click_element
  map "`rc", Commands.right_click_element
  map "`dc", Commands.double_click_element
  map "`cm", Commands.show_current_app_menu_items
  map "`q", Commands.quit_current_application
end

# Register commands 
# -----------------------------------------------------------
command "Volume Up" do 
  `osascript -e 'set volume output volume (output volume of (get volume settings) + 7)'`
end

command "Volume Down" do 
  `osascript -e 'set volume output volume (output volume of (get volume settings) - 7)'`
end

ApplicationLauncher.register('/Applications',:category => :app)
ApplicationLauncher.register('/Applications/Xcode.app/Contents/Applications',:category => :app)
ApplicationLauncher.register('/System/Library/CoreServices',:category => :app)
ApplicationLauncher.register('/System/Library/PreferencePanes',:extension => '.prefPane',:category => :pref_pane)
