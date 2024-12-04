#!/system/bin/sh

# This script runs during the Magisk module installation process

# Define the target directory for the Samsung Camera
TARGET_DIR="/system/priv-app/SamsungCamera"

# Display a message to the user
ui_print "Samsung Camera Magisk Module Installation"
ui_print "This module will install the Samsung Camera"
ui_print "app as a system app in the following location:"
ui_print "$TARGET_DIR"

# Check if the directory already exists
if [ -d "$TARGET_DIR" ]; then
    ui_print "Directory $TARGET_DIR already exists. Proceeding with the installation."
else
    ui_print "Creating directory $TARGET_DIR."
    mkdir -p "$TARGET_DIR"
fi

# Copy the Samsung Camera APK and associated files to the system partition
cp -R $MODPATH/system/priv-app/SamsungCamera/* $TARGET_DIR/

# Verify that the files were copied
if [ -f "$TARGET_DIR/SamsungCamera.apk" ]; then
    ui_print "Samsung Camera APK placed successfully."
else
    ui_print "Error: Samsung Camera APK wasn't installed successfully!"
    exit 1
fi

# Ensure proper file permissions
chmod 755 "$TARGET_DIR/SamsungCamera.apk"
chmod 755 "$TARGET_DIR/oat/arm64/*"

ui_print "Installation complete!"
ui_print "You can now reboot your device to apply the changes."
