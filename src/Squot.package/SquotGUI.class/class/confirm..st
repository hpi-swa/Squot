user interface
confirm: aString
	^ self runInUiProcess: [super confirm: aString]