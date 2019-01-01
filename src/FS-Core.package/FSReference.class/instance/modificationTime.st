accessing
modificationTime 
	"Returns the last date of modification of self"
	^ (filesystem entryAt: self path) modificationSeconds