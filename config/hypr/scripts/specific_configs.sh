
#!/usr/bin/bash

# dispatch monitor for laptop
if [[ $HOSTNAME == *-lt ]] then
  bash ~/.config/hypr/laptop_config/monitors.sh;
else
  bash ~/.config/hypr/desktop_config/monitors.sh;
  bash ~/.config/hypr/desktop_config/workspaces.sh;
fi

