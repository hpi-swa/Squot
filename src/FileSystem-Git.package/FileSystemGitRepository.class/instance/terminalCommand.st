git porcelain - external
terminalCommand
	^ GitFeatureFlags terminalCommandForExternalCommands
		ifNotEmpty: [:command |
			(self commandExists: command)
				ifTrue: [command]
				ifFalse: [
					GitFeatureFlags terminalCommandForExternalCommands: ''.
					self terminalCommand]]
		ifEmpty: [ | command |
			command := self detectTerminalCommand.
			GitFeatureFlags terminalCommandForExternalCommands: command.
			command]