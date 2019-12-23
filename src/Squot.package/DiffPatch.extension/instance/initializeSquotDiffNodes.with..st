*Squot-Tools-Diffs
initializeSquotDiffNodes: aCollection with: aDiffNodesBuilder
	snippets with: aCollection do: [:eachSnippet :eachDiffNode |
		eachDiffNode
			title: 'diff chunk'
			content: (SquotGenericDiffSnippet newFrom: eachSnippet)
			children: #()]