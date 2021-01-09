initialize-release
setKey: aReference working: workingAddedObject owner: workingOwnerObject incoming: incomingAddedObject owner: incomingOwnerObject
	super setKey: aReference base: nil working: workingAddedObject incoming: incomingAddedObject.
	self resetChoice.
	workingOwner := workingOwnerObject.
	incomingOwner := incomingOwnerObject.