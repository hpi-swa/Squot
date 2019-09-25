accessing
nameOf: anObject ifAbsent: absentBlock
	"Answer the remembered name of anObject in this graph, or evaluate the block if no name
	for the object is known."
	"objectNames has weak keys, which can become nil. Therefore we cannot look up names
	for nil, since it leads to false positives. Fortunately, nil or 'shadow of nil' should never get a
	name anyway."
	anObject ifNil: [^ absentBlock value].
	^ objectNames at: anObject ifAbsent:
		[delegateRegistry
			ifNotNil: [delegateRegistry nameOf: anObject ifAbsent: absentBlock]
			ifNil: [absentBlock value]]