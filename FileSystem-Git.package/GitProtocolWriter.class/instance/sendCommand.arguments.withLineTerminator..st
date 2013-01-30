sending
sendCommand: commandName arguments: arguments withLineTerminator: aBoolean
	^ self
		sendCommand: (self concatenateCommand: commandName withArguments:  arguments)
		withLineTerminator: aBoolean