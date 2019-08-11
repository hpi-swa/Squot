diffing low-level
replacing: leftShadow with: rightShadow
	"Answer a diff that will replace the target object with the rightShadow"
	self assert: objectDiffs isEmpty description: 'only the start object can be replaced, the replacement of other objects is captured in slot reassignments'.
	^ self diffFrom: leftShadow to: rightShadow
		ifNew: [SquotObjectReplacement left: leftShadow right: rightShadow]
		andInitialize: []