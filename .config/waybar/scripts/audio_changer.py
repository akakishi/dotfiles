#!/usr/bin/env python 
import subprocess

# function to parse output of command "wpctl status" and return a dictionary of sinks with their id and name.
def parse_wpctl_status():
    # Execute the wpctl status command and store the output in a variable.
    output = str(subprocess.check_output("wpctl status", shell=True, encoding='utf-8'))

    # remove the ascii tree characters and return a list of lines
    lines = output.replace("├", "").replace("─", "").replace("│", "").replace("└", "").splitlines()

    # get the index of the Sinks line as a starting point
    sinks_index = None
    for index, line in enumerate(lines):
        if "Sinks:" in line:
            sinks_index = index
            break

    # start by getting the lines after "Sinks:" and before the next blank line and store them in a list
    sinks = []
    for line in lines[sinks_index +1:]:
        if not line.strip():
            break
        sinks.append(line.strip())

    # remove the "[vol:" from the end of the sink name
    for index, sink in enumerate(sinks):
        sinks[index] = sink.split("[vol:")[0].strip()
    
    # strip the * from the default sink and instead append "- Default" to the end. Looks neater in the wofi list this way.
    for index, sink in enumerate(sinks):
        if sink.startswith("*"):
            sinks[index] = sink.strip().replace("*", "").strip() + " - Default"

    # make the dictionary in this format {'sink_id': <int>, 'sink_name': <str>}
    sinks_dict = [{"sink_id": int(sink.split(".")[0]), "sink_name": sink.split(".")[1].strip()} for sink in sinks]

    return sinks_dict

# get the list of sinks ready to put into wofi - highlight the current default sink
output = ''
sinks = parse_wpctl_status()
idx = -1
default_pos = 0
for items in sinks:
    if idx > -1:
        output += f"\n"
    idx += 1
    if items['sink_name'].endswith(" - Default"):
        default_pos = idx
        output += f"=> {items['sink_name'].replace(" - Default", "")}"
    else:
        output += f"{items['sink_name']}"

# Call wofi and show the list. take the selected sink name and set it as the default sink
wofi_command = f"""echo '{output}' | wofi \\
    --lines 8 \\
    --columns 1 \\
    --show=dmenu \\
    --hide-scroll \\
    --allow-markup \\
    --define=hide_search=true \\
    --define=dynamic_lines=true \\
    --width=700 \\
    -s ~/.config/wofi/style-no-search.css"""
#wofi_process = subprocess.run(wofi_command, shell=True, encoding='utf-8', stdout=subprocess.PIPE, stderr=subprocess.PIPE)

rofi_command = f"""echo '{output}' | rofi \\
    -dmenu \\
    -m -1 \\
    -theme $HOME/.config/rofi/config/sinkmenu.rasi \\
    -selected-row {default_pos}"""
rofi_process = subprocess.run(rofi_command, shell=True, encoding='utf-8', stdout=subprocess.PIPE, stderr=subprocess.PIPE)

if rofi_process.returncode != 0:
    print("User cancelled the operation.")
    exit(0)

selected_sink_name = rofi_process.stdout.strip()
sinks = parse_wpctl_status()
selected_sink = next(sink for sink in sinks if sink['sink_name'] == selected_sink_name)
subprocess.run(f"wpctl set-default {selected_sink['sink_id']}", shell=True)
