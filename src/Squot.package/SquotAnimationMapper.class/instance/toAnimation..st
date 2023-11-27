migrations
toAnimation: anObject
	(anObject isKindOf: GIFReadWriter) ifTrue: [^ self gifReadWriterToAnimation: anObject].
	^ anObject