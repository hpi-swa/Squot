testing
shouldObjectHaveNameAssigned: anObject
	"Actually, this depends on whether the original object had an identifier...
	The DiskProxy should not get its own name, but it can bear the name of its original object in object graph snapshots."
	^ false