commands
writeCommand: commandName arguments: arguments withLineTerminator: aBoolean
	^ self
		writeCommand: (self concatenateCommand: commandName withArguments:  arguments)
		withLineTerminator: aBoolean