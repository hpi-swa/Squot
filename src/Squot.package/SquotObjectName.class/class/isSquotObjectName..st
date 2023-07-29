testing
isSquotObjectName: anObject
	^ anObject isArray and: [anObject isEmpty or: [anObject last class = UUID]]