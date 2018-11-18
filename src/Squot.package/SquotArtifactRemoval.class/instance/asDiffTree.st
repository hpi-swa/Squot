converting
asDiffTree
	| title |
	title := (self path isEmpty
		ifTrue: [left printString]
		ifFalse: [self path]), ' (removed)'.
	^ SquotDiffNode title: title content: self children: self topNodes
		onInclude: [] onExclude: []