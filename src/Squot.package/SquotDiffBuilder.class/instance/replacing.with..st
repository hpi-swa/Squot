diffing low-level
replacing: leftShadow with: rightShadow
	"Answer a diff that will replace the target object with the rightShadow"
	| newName |
	self assert: objectDiffs isEmpty description: 'only the start object can be replaced, the replacement of other objects is captured in slot reassignments'.
	newName := shadowNames at: rightShadow undecorated.
	(left includesObjectNamed: newName)
		ifFalse: [self addedObject: rightShadow withName: newName].
	^ self diffFrom: leftShadow to: rightShadow
		ifNew: [SquotObjectReplacement left: leftShadow right: rightShadow]
		andInitialize: []