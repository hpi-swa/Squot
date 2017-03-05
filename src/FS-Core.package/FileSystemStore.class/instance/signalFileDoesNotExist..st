error signalling
signalFileDoesNotExist: aPath
	"Raise FileDoesNotExist exception"
		
	^ FileDoesNotExist signalWith: aPath