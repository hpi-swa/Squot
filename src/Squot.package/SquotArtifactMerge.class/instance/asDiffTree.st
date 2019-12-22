converting
asDiffTree
	| node |
	node := self hasConflicts
		ifTrue: [SquotMergeDiffNode
					title: self diffTreeNodeTitle
					content: self
					children: self diffTreeChildren
					onInclude: [self chooseIncoming]
					onExclude: [self chooseWorking]
					onReset: [self resetChoice]]
		ifFalse: [SquotDiffNode
					title: self diffTreeNodeTitle
					content: self
					children: self diffTreeChildren
					onInclude: [self chooseIncoming]
					onExclude: [self chooseWorking]].
	node withAllChildren do: [:each | each artifactDiff: self].
	^ node