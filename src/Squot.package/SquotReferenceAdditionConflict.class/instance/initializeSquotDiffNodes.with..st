*Squot-Tools
initializeSquotDiffNodes: aCollection with: aDiffNodesBuilder
	aCollection do: [:each | each
		setTitle: 'conflicting addition'
		content: self
		children: Array new;
		includeBlock: [];
		excludeBlock: [];
		resetBlock: []].