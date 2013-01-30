private sending
sendCommand: commandName argument: anArgument
	^ self sendRawCommand: commandName argument: anArgument, String lf