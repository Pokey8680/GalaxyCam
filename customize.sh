#!/system/bin/sh

# This script runs during the Magisk module installation process

# Define the target directory for the Samsung Camera
TARGET_DIR="/system/priv-app/SamsungCamera"

# Display message to the user
ui_print " "
ui_print "Putting app files in $TARGET_DIR"

# Copy apk files to /system/priv-app/SamsungCamera (Magisk does this automatically)

# Set proper permissions
chmod -R 755 $TARGET_DIR

ui_print " "
ui_print "Installation complete!"
ui_print "Please reboot your device to apply the changes."
