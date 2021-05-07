user interface
chooseDirectory: aString
	^ self runInUiProcess: [UIManager default chooseDirectory: aString]