private sending
encodeCommandLine: aCommandString
	^ self encodeRawCommandLine: aCommandString, String lf