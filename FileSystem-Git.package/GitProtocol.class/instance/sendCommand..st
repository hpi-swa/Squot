accessing
sendCommand: aCommandString
	self sendData: (self encodeCommandLine: aCommandString).
	