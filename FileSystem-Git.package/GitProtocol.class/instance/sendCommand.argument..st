accessing
sendCommand: commandName argument: anArgument
	^ self sendRawCommand: commandName argument: anArgument, String lf