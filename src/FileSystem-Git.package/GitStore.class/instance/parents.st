git-delegating
parents
	modManager hasModifications ifTrue: [^ {revision}].
	revision ifNil: [ ^ OrderedCollection new ].
	^ revision parents 