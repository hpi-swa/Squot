*Squot-Tests-Tools
asDiffTree
	diffTreeNodes ifNotNil: [^ diffTreeNodes].
	^ hasConflicts == false
		ifTrue: [(SquotDiffNode
					title: 'Modification'
					content: self
					children: #()
					onInclude: [self chooseIncoming]
					onExclude: [self chooseWorking])
					artifactDiff: self;
					yourself]
		ifFalse: [(SquotMergeDiffNode
					title: 'Merge'
					content: self
					children: #()
					onInclude: [self chooseIncoming]
					onExclude: [self chooseWorking]
					onReset: [self resetChoice])
					artifactDiff: self;
					yourself]