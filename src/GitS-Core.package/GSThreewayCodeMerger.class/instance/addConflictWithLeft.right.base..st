definitions-operations
addConflictWithLeft: leftDefinition right: rightDefinition base: baseDefinition
	(self tryAutoMergeLeft: leftDefinition right: rightDefinition base: baseDefinition)
		ifTrue: [^ self].
	self conflicts add: (GSMergeConflict left: leftDefinition right: rightDefinition base: baseDefinition).