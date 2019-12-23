*Squot-Tools
asDiffTree
	| title node |
	title := (self path isEmpty
		ifTrue: [right printString]
		ifFalse: [self path]), ' (added)'.
	node := SquotDiffNode title: title content: self children: self topNodes
		onInclude: [] onExclude: [].
	node withAllChildren do: [:each | each artifactDiff: self].
	^ node