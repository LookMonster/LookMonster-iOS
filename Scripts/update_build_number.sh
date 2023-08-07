#!/bin/sh

plistPath="${PROJECT_DIR}/${PROJECT_NAME}/Info.plist"
buildNumber=$(/usr/libexec/PlistBuddy -c "Print CFBundleVersion" "${plistPath}")
newBuildNumber=$(($buildNumber + 1))
/usr/libexec/PlistBuddy -c "Set :CFBundleVersion $newBuildNumber" "${plistPath}"
