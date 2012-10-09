# Start Keymando at login
# -----------------------------------------------------------
start_at_login

# Disable Keymando when using these applications
# -----------------------------------------------------------
disable "Remote Desktop Connection"
# disable /VirtualBox/

# Basic mapping
# -----------------------------------------------------------
# map "<Ctrl-[>", "<Escape>"
# map "<Ctrl-m>", "<Ctrl-F2>"


# Commands
# -----------------------------------------------------------

# Command launcher window via Cmd-Space
map "<Cmd-9>" do                                                                                                                                                                                                         
  trigger_item_with(Commands.items, RunRegisteredCommand.new)                                                                                                                                                             
end 

# Register commands 
# -----------------------------------------------------------
command "Volume Up" do 
  `osascript -e 'set volume output volume (output volume of (get volume settings) + 7)'`
end

command "Volume Down" do 
  `osascript -e 'set volume output volume (output volume of (get volume settings) - 7)'`
end

# Repeat last command via Cmd-.
map "<Cmd-.>", RunLastCommand.instance

# -----------------------------------------------------------
# Visit http://keymando.com to see what else Keymando can do!
# -----------------------------------------------------------

map "<Cmd-h>", "<Left>"
map "<Cmd-j>", "<Down>"
map "<Cmd-k>", "<Up>"
map "<Cmd-l>", "<Right>"
map "<Cmd-m>", "<Tab>"
map "<Cmd-,>", "<Shift-Tab>"
map "<Cmd-n>", "<Ctrl-n>"
map "<Cmd-p>", Commands.press_button_on_ui