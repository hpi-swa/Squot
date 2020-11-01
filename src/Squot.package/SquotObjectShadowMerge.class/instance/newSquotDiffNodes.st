*Squot-Tools
newSquotDiffNodes
	| nodes |
	nodes := OrderedCollection new.
	containerModifications keysAndValuesDo:
		[:key :each |
		nodes add:
			(SquotDiffNode
				title: key asString
				content: each
				children: #()
				onInclude: [self chooseIncoming]
				onExclude: [self chooseWorking])].
	containerConflicts keysAndValuesDo:
		[:key :each |
		nodes add:
			(SquotMergeDiffNode
				title: key asString
				content: each
				children: #()
				onInclude: [self chooseIncoming]
				onExclude: [self chooseWorking]
				onReset: [self resetChoice])].
	elementMerges keysAndValuesDo:
		[:key :each |
		nodes add: (each hasConflicts
			ifTrue:
				[SquotMergeDiffNode
					title: key asString
					content: each
					children: #()
					onInclude: [self chooseIncoming]
					onExclude: [self chooseWorking]
					onReset: [self resetChoice]]
			ifFalse:
				[SquotDiffNode
					title: key asString
					content: each
					children: #()
					onInclude: [self chooseIncoming]
					onExclude: [self chooseWorking]])].
	^ nodes