user interface
requestPassword: aString
	^ self runInUiProcess: [UIManager default requestPassword: aString]