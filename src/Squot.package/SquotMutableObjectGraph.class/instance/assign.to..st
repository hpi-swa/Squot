adding
assign: aName to: anObject
	self answer: aName whenAskedForTheNameOf: anObject.
	objects at: aName put: anObject.
	delegateRegistry ifNotNil: [delegateRegistry assign: aName to: anObject].