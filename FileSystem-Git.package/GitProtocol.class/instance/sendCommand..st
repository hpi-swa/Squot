private
sendCommand: aCommandString
	self sendData: (self encodeCommandLine: aCommandString).
	