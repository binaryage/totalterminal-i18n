on run
	set newline to ASCII character 10
	set stdout to ""
	set stdout to stdout & "  shutdown Terminal ..." & newline
	try
		tell application "Terminal" to quit
	on error
		set stdout to stdout & "    Terminal was not running prior uninstallation" & newline
	end try

	set stdout to stdout & "  shutdown TotalTerminalCrashWatcher ..." & newline
	try
		do shell script "killall -SIGINT TotalTerminalCrashWatcher" with administrator privileges
	on error
		set stdout to stdout & "    TotalTerminalCrashWatcher was not running" & newline
	end try

	set stdout to stdout & "  remove TotalTerminal.app ..." & newline
	try
		do shell script "sudo rm -rf \"/Applications/TotalTerminal.app\"" with administrator privileges
	on error
		set stdout to stdout & "    unable to remove /Applications/TotalTerminal.app" & newline
	end try


	set stdout to stdout & "  remove TotalTerminal.osax ..." & newline
	try
		do shell script "sudo rm -rf \"/Library/ScriptingAdditions/TotalTerminal.osax\"" with administrator privileges
	on error
		set stdout to stdout & "    unable to remove /Library/ScriptingAdditions/TotalTerminal.osax" & newline
	end try

	set stdout to stdout & "  relaunch Terminal ..." & newline
	try
		tell application "Terminal" to launch
	on error
		set stdout to stdout & "    failed to relaunch Terminal" & newline
	end try

	set stdout to stdout & "TotalTerminal uninstallation done" & newline

	-- at this point Terminal should start cleanly and with no signs of TotalTerminal
	-- you may check Events/Replies tab to see if there were no issues with uninstallation

	stdout -- this is needed for platypus to display output in details window
end run