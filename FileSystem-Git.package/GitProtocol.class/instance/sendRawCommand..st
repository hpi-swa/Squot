private sending
sendRawCommand: aCommandString
	self sendData: (self encodeRawCommandLine: aCommandString).
	