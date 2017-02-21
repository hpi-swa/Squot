instance creation
continueWith: aZnClient from: aUrl content: aString
	"This is only supported in the HTTP protocols (smart and dumb)"

	^ self subclassResponsibility