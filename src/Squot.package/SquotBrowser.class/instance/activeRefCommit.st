accessing
activeRefCommit
	^ self activeRef ifNotNil: [:ref | self unitOfWork objectReferenced: ref]