error signalling
signalFileExists: aPath
	"Raise FSFileExist exception"
	
	^ FSFileExists signalWith: aPath