testing
ancestorOf: anFSReference that: aBlock
	| parent |
	(aBlock value: anFSReference) ifTrue: [^ anFSReference].
	parent := anFSReference parent.
	anFSReference = parent ifTrue: [^ nil].
	^ self ancestorOf: parent that: aBlock