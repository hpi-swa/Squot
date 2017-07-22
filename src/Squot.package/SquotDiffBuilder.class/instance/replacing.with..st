diffing low-level
replacing: leftShadow with: rightShadow
	"Answer a diff that will replace the target object with the rightShadow"
	objectDiffs ifNotEmpty: [^ nil
		"only capture the startObject replacement, the rest are reassignments only"].
	^ self diffFrom: leftShadow to: rightShadow
		ifNew: [SquotObjectReplacement left: leftShadow right: rightShadow]
		andInitialize: []