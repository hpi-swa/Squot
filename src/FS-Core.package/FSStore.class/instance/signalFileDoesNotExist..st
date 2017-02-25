error signalling
signalFileDoesNotExist: aPath
	"Raise FSFileDoesNotExist exception"
		
	^ FSFileDoesNotExist signalWith: aPath