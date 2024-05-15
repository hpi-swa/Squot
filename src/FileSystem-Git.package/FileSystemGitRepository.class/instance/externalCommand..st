git porcelain - external
externalCommand: aString
	| osProcess |
	osProcess := (Smalltalk classNamed: #OSProcess) ifNil: [
		(self confirm: 'OSProcess is not installed, but is needed to run git externally. Install it?') ifFalse: [^ self].
		Installer ss project: 'OSProcess'; install: 'OSProcess'.
		Installer ss project: 'CommandShell'; install: 'CommandShell'.
		^ self externalCommand: aString].
	osProcess waitForCommand:
		(osProcess isWindows
			ifTrue: ['cmd.exe /c "{1}"' format: {aString copyReplaceAll: '"' with: '\"'}]
			ifFalse: [self terminalCommand: aString]).