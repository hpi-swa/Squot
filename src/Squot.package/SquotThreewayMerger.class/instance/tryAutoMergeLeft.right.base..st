as yet unclassified
tryAutoMergeLeft: leftDefinition right: rightDefinition base: baseDefinition
	| allDefinitions |
	allDefinitions := {leftDefinition. rightDefinition. baseDefinition}.
	(allDefinitions anySatisfy: #isNil) ifTrue: [^ false].
	(allDefinitions allSatisfy: #isMethodDefinition)
		ifTrue: [^ self tryAutoMergeMethodsLeft: leftDefinition right: rightDefinition base: baseDefinition].
	^ false