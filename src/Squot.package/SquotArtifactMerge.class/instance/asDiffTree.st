converting
asDiffTree
	^ self hasConflicts
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
					onExclude: [self chooseWorking]]