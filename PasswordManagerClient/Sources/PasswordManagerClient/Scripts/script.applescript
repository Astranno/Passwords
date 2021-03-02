use AppleScript version "2.5" -- runs on 10.11 (El Capitan) and later

if not IsAlreadyRunning() then
	tell application "Safari"
		close window 1
	end tell
end if

ShowPasswords()

on IsAlreadyRunning()
	set isRunning to false
	set invokedBy to ""
	tell application "System Events"
		set invokedBy to get the name of the current application
		activate "Safari"
		set isRunning to true
	end tell
	return isRunning
end IsAlreadyRunning

on ShowPasswords()
	tell application "Safari"
		activate
	end tell
	
	tell application "System Events" to tell application process "Safari"
		set frontmost to false
		click menu item "Preferences…" of menu "Safari" of menu bar item 2 of menu bar 1
		set tb to toolbar 1 of window 1
		set buttonName to (name of button 4 of tb as string)
		click button 4 of tb
	end tell
end ShowPasswords