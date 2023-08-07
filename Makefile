generate:
	tuist fetch
	tuist generate
plistPath="${PROJECT_DIR}/${PROJECT_NAME}/Info.plist"
buildNumber=$(/usr/libexec/PlistBuddy -c "Print CFBundleVersion" "${plistPath}")
newBuildNumber=$(($buildNumber + 1))
/usr/libexec/PlistBuddy -c "Set :CFBundleVersion $newBuildNumber" "${plistPath}"


clean:
	rm -rf **/*.xcodeproj
	rm -rf *.xcworkspace

reset:
	tuist clean
	rm -rf **/*.xcodeproj
	rm -rf *.xcworkspace

regenerate:
	rm -rf **/*.xcodeproj
	rm -rf *.xcworkspace
	tuist generate
