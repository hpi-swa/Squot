as yet unclassified
anyChildNeedsChoice
	| allChildren |
	allChildren := Generator on: [:generator | self submitSelfAndChildrenTo: generator].
	allChildren do: [:each | each needsChoice ifTrue: [^ true]].
	^ false