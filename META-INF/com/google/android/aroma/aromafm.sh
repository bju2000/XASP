#!/sbin/sh
# Save Zip Location
echo "ziplocation=${UPDATE_PACKAGE}" > /tmp/aroma/aromafm.prop

# Copy Configuration file
cp /tmp/aroma/aromafm.cfg `echo "${UPDATE_PACKAGE}.cfg"`
