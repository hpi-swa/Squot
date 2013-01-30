private sending
sendCommand: aCommandString
	self sendData: (self encodeCommandLine: aCommandString).
	