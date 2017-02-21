testing
hasErrors
	^ unpackStatus ~= 'ok' or: [errors isEmpty not]