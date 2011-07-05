error signalling
signalDirectoryDoesNotExist: aPath
	"Raise FSDirectoryDoesNotExist exception"
		
	^ FSDirectoryDoesNotExist signalWith: aPath