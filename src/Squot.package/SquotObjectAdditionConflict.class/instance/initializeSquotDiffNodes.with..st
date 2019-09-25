converting
initializeSquotDiffNodes: aCollection with: aDiffNodesBuilder
	aCollection do: [:each | each
		title: 'conflicting addition'
		content: self
		children: Array new;
		includeBlock: [];
		excludeBlock: [];
		resetBlock: []].