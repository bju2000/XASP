#################################################
#UNITY#CONFIG#SCRIPT#############################
#BY#TOPJOHNWU,#MODIFIED#BY#ZACKPTG5#AND#MIUSTONE#
#################################################

if [ -z $UF ]; then
  UF=$TMPDIR/common/unityfiles
  unzip -oq "$ZIPFILE" 'common/unityfiles/util_functions.sh' -d $TMPDIR >&2
  [ -f "$UF/util_functions.sh" ] || { ui_print "! Unable to extract zip file !"; exit 1; }
  . $UF/util_functions.sh
fi

comp_check

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

REPLACE_EXAMPLE="
/system/app/Youtube
/system/priv-app/SystemUI
/system/priv-app/Settings
/system/framework
"

REPLACE="
/system/app/AudioFX
/system/app/Camera
/system/app/Camera2
/system/app/Gallery
/system/app/MusicFX
/system/priv-app/AudioFX
/system/priv-app/Camera
/system/priv-app/Camera2
/system/priv-app/Contacts
/system/priv-app/DocumentsUI
/system/priv-app/Dialer
/system/priv-app/Gallery
/system/priv-app/Lawnchair
/system/priv-app/MusicFX
"

print_modname() {
  center_and_print
  ui_print " "
  ui_print "$NAME"
  ui_print " "
  ui_print "$VERSION"
  ui_print " "
  unity_main
}

set_permissions() {
  : 

}

unity_custom() {
  : 
}

