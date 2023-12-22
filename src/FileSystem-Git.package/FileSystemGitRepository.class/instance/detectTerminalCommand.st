git porcelain - external
detectTerminalCommand
	^ self knownTerminalCommands
		detect: [:each | self commandExists: (each copyUpTo: Character space)]
		ifNone: [UIManager request:
					'No terminal emulator could be detected. ',
					'Please provide a command to spawn a terminal emulator. ',
					(Preferences pragmaPreferenceFor: GitFeatureFlags getter: #terminalCommandForExternalCommands) helpString]