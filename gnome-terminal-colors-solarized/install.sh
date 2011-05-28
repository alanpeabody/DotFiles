#!/usr/bin/env bash

dir=$(dirname $0)
gconfdir=/apps/gnome-terminal/profiles

echo # This makes the prompts easier to follow (as do other random echos below)

###############################
### Select the color scheme ###
###############################

echo "Please select a color scheme:"
select scheme in light dark; do
  echo
  if [[ -z $scheme ]]; then
    echo -e "ERROR: Invalid selection -- ABORTING!\n"
    exit 2
  fi

  case $scheme in
    light ) bg_color_file=$dir/colors/base3
            fg_color_file=$dir/colors/base00
            bold_color_file=$dir/colors/base01
            ;;

    dark  ) bg_color_file=$dir/colors/base03
            fg_color_file=$dir/colors/base0
            bold_color_file=$dir/colors/base1
            ;;
  esac
  break
done

########################
### Select a profile ###
########################

typeset -A profiles
for profile_key in $(gconftool-2 -R $gconfdir | grep $gconfdir  | cut -d/ -f5 | cut -d: -f1); do
  profile_name=$(gconftool-2 -g $gconfdir/$profile_key/visible_name)
  profiles[$profile_name]=$profile_key
done

echo "Please select a Gnome Terminal profile:"
select profile_name in "${!profiles[@]}"; do
  echo
  if [[ -z $profile_name ]]; then
    echo -e "ERROR: Invalid selection -- ABORTING!\n"
    exit 1
  fi

  profile_key=${profiles[$profile_name]}
  break
done

profile_key=${profiles[$profile_name]}

#########################################################
### Show the choices made and prompt for confirmation ###
#########################################################

echo    "You have selected:"
echo    "  Scheme:  $scheme"
echo -e "  Profile: $profile_name (gconf key: $profile_key)\n"

typeset -u confirmation
echo -n "Is this correct? (YES to continue) "
read confirmation

if [[ $confirmation != YES ]]; then
  echo -e "ERROR: Confirmation failed -- ABORTING!\n"
  exit 3
fi

########################
### Finally... do it ###
########################

echo -e "Confirmation received -- applying settings\n"

# set palette
gconftool-2 -s -t string /apps/gnome-terminal/profiles/$profile_key/palette $(cat $dir/colors/palette)

# set highlighted color to be different from foreground-color
gconftool-2 -s -t bool /apps/gnome-terminal/profiles/$profile_key/bold_color_same_as_fg false

# set foreground to base00 and background to base3 and highlight color to base01
gconftool-2 -s -t string /apps/gnome-terminal/profiles/$profile_key/background_color $(cat $bg_color_file)
gconftool-2 -s -t string /apps/gnome-terminal/profiles/$profile_key/foreground_color $(cat $fg_color_file)
gconftool-2 -s -t string /apps/gnome-terminal/profiles/$profile_key/bold_color       $(cat $bold_color_file)

# make sure the profile is set to not use theme colors
gconftool-2 -s -t bool /apps/gnome-terminal/profiles/$profile_key/use_theme_colors false

