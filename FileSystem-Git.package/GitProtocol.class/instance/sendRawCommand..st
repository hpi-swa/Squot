private
sendRawCommand: aCommandString
	self sendData: (self encodeRawCommandLine: aCommandString).
	