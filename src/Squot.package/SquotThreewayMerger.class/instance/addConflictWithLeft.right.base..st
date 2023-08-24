as yet unclassified
addConflictWithLeft: leftDefinition right: rightDefinition base: baseDefinition
	(self tryAutoMergeLeft: leftDefinition right: rightDefinition base: baseDefinition)
		ifTrue: [^ self].
	self conflicts add: (SquotMergeConflict left: leftDefinition right: rightDefinition base: baseDefinition).