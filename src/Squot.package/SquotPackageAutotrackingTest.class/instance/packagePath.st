tests
packagePath
	^ path ifNil:
		[(workingCopy store pathsOf: package) anyOne]