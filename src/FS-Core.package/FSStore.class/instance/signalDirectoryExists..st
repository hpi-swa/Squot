error signalling
signalDirectoryExists: aPath
	"Raise FSDirectoryExists exception"
		
	^ FSDirectoryExists signalWith: aPath