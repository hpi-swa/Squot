private
basicOpen
	"get the raw stream description from the filesystem's store"
	^ self filesystem 
		openStreamDescription: reference path
		writable: writable