user interface
request: aString initialAnswer: anObject
	^ self runInUiProcess: [UIManager default request: aString initialAnswer: anObject]