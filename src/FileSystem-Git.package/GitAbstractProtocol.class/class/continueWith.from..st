instance creation
continueWith: initialResponse from: aUrl
	"This is only supported in the HTTP protocols (smart and dumb)"

	^ self subclassResponsibility