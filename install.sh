##########################################################################################
#
# Unity Config Script
# by topjohnwu, modified by Zackptg5
#
##########################################################################################

##########################################################################################
# Unity Logic - Don't change/move this section
##########################################################################################

if [ -z $UF ]; then
  UF=$TMPDIR/common/unityfiles
  unzip -oq "$ZIPFILE" 'common/unityfiles/util_functions.sh' -d $TMPDIR >&2
  [ -f "$UF/util_functions.sh" ] || { ui_print "! Unable to extract zip file !"; exit 1; }
  . $UF/util_functions.sh
fi

comp_check

##########################################################################################
# Config Flags
##########################################################################################

# Uncomment and change 'MINAPI' and 'MAXAPI' to the minimum and maximum android version for your mod
# Uncomment DYNLIB if you want libs installed to vendor for oreo+ and system for anything older
# Uncomment SYSOVER if you want the mod to always be installed to system (even on magisk) - note that this can still be set to true by the user by adding 'sysover' to the zipname
# Uncomment DEBUG if you want full debug logs (saved to /sdcard in magisk manager and the zip directory in twrp) - note that this can still be set to true by the user by adding 'debug' to the zipname
AUTHOR=$(grep_prop author $INSTALLER/module.prop)
AUTOMOUNT=true
BUILDPROP=true
DEBUG=false
DYNAMICOREO=true
LATESTARTSERVICE=true
MINAPI=28
NAME=$(grep_prop name $INSTALLER/module.prop)
POSTFSDATA=true
PROPFILE=true
SKIPMOUNT=false
SYSOVERRIDE=false
SYSTEMINSTALL=false
VERSION=$(grep_prop version $INSTALLER/module.prop)

##########################################################################################
# Replace list
##########################################################################################

# List all directories you want to directly replace in the system
# Check the documentations for more info why you would need this

# Construct your list in the following format
# This is an example
REPLACE_EXAMPLE="
/system/app/Youtube
/system/priv-app/SystemUI
/system/priv-app/Settings
/system/framework
"

# Construct your own list here
REPLACE="
/system/app/Calculator
/system/app/DeskClock
/system/app/Email
/system/app/FileExplorer
/system/app/YouTube
/system/app/MiuiCompass
/system/app/Notes
/system/priv-app/Browser
/system/priv-app/Calendar
/system/priv-app/Contacts
/system/priv-app/Mms
/system/priv-app/MiuiCamera
/system/priv-app/MiuiGallery
/system/priv-app/Music
/system/priv-app/Weather
"

##########################################################################################
# Custom Logic
##########################################################################################

# Set what you want to display when installing your module

print_modname() {
  center_and_print # Replace this line if using custom print stuff
  ui_print " "
  ui_print "$NAME"
  ui_print " "
  ui_print "$VERSION"
  ui_print " "
  ui_print "BY $AUTHOR"
  ui_print " "
  ui_print " "
  unity_main # Don't change this line
}

set_permissions() {
  : # Remove this if adding to this function

  # Note that all files/folders have the $UNITY prefix - keep this prefix on all of your files/folders
  # Also note the lack of '/' between variables - preceding slashes are already included in the variables
  # Use $VEN for vendor (Do not use /system$VEN, the $VEN is set to proper vendor path already - could be /vendor, /system/vendor, etc.)

  # Some examples:
  
  # For directories (includes files in them):
  # set_perm_recursive  <dirname>                <owner> <group> <dirpermission> <filepermission> <contexts> (default: u:object_r:system_file:s0)
  
  # set_perm_recursive $UNITY/system/lib 0 0 0755 0644
  # set_perm_recursive $UNITY$VEN/lib/soundfx 0 0 0755 0644

  # For files (not in directories taken care of above)
  # set_perm  <filename>                         <owner> <group> <permission> <contexts> (default: u:object_r:system_file:s0)
  
  # set_perm $UNITY/system/lib/libart.so 0 0 0644
}

# Custom Variables for Install AND Uninstall - Keep everything within this function - runs before uninstall/install
unity_custom() {
  : # Remove this if adding to this function
}

# Custom Functions for Install AND Uninstall - You can put them here
