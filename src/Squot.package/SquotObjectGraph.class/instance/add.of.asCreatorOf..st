adding
add: aSlot of: creator asCreatorOf: anObject
	super add: aSlot of: creator asCreatorOf: anObject.
	delegateRegistry add: aSlot of: creator asCreatorOf: anObject.