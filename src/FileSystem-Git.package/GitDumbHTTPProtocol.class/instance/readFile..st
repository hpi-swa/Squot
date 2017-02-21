command
readFile: aPath
	self flag: 'to be fixed '.
	^ ZnEasy get: url asString, aPath username: 'admin' password: 'admin'