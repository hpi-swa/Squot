converting
asDiffTree
	| title |
	title := (self path isEmpty
		ifTrue: [right printString]
		ifFalse: [self path]), ' (added)'.
	^ SquotDiffNode title: title content: self children: self topNodes
		onInclude: [] onExclude: []