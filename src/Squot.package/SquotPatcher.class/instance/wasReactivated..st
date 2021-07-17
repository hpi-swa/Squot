private
wasReactivated: anObject
	^ (pendingOutgoingReferences includesKey: anObject) not