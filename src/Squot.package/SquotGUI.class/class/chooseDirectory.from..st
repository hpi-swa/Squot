user interface
chooseDirectory: aString from: aDirectory
	^ self runInUiProcess: [UIManager default chooseDirectory: aString from: aDirectory]