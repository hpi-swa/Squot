*Squot-Tools
newSquotDiffNodes
	^ working startName = incoming startName
		ifTrue: [self mergeOfStartObject newSquotDiffNodes]
		ifFalse: [{SquotMergeDiffNode
				title: 'Distinct objects'
				content: self
				children: #()
				onInclude: [self chooseIncoming]
				onExclude: [self chooseWorking]
				onReset: [self resetChoice]}]