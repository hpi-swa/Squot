*Squot-Tools
asSquotHierarchicalDiff
	^ {SquotMergeDiffNode
		title: 'Merge object graph'
		content: self
		children: #()
		onInclude: [choice := #incoming]
		onExclude: [choice := #working]
		onReset: [choice := nil]}