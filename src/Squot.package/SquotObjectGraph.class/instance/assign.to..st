adding
assign: aName to: anObject
	super assign: aName to: anObject.
	objects at: aName put: anObject.
	delegateRegistry ifNotNil: [delegateRegistry assign: aName to: anObject].