callbacks
is: anObject instanceOf: anotherObject
	| graph otherGraph id otherId |
	self flag: #todo. "Should sender ask mirror instead?"
	(working includes: anObject undecorated) ifTrue: [graph := working. otherGraph := incoming].
	(graph isNil and: [incoming includes: anObject undecorated]) ifTrue: [graph := incoming. otherGraph := working].
	(graph isNil and: [base includes: anObject undecorated]) ifTrue: [graph := base. otherGraph := incoming].
	(graph isNil or: [(id := graph nameOf: anObject undecorated ifAbsent: []) isNil])
		ifTrue: [^ anObject undecorated = anotherObject undecorated].
	ids at: anObject undecorated put: id.
	otherId := graph nameOf: anotherObject undecorated ifAbsent: [].
	otherId ifNil: [otherId := otherGraph nameOf: anotherObject undecorated ifAbsent: []].
	otherId ifNotNil: [ids at: anotherObject undecorated put: otherId].
	^ id = otherId