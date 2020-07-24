user interface
request: aString
	^ self runInUiProcess: [UIManager default request: aString]