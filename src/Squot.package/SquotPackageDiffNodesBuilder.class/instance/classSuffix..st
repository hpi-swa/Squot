private
classSuffix: aPatchOperationOrConflictOrNil
	aPatchOperationOrConflictOrNil ifNil: [^ ''].
	aPatchOperationOrConflictOrNil definition isClassDefinition ifFalse: [^ ''].
	aPatchOperationOrConflictOrNil isConflict
		ifTrue:
			[aPatchOperationOrConflictOrNil operation isAddition ifTrue: [^ ' (removed/changed)'].
			aPatchOperationOrConflictOrNil operation isRemoval ifTrue: [^ '(changed/removed)']]
		ifFalse: 
			[aPatchOperationOrConflictOrNil isAddition ifTrue: [^ ' (added)'].
			aPatchOperationOrConflictOrNil isRemoval ifTrue: [^ ' (removed)']].
	^ ''