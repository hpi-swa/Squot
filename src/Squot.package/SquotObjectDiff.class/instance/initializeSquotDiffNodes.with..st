*Squot-Tools
initializeSquotDiffNodes: aCollection with: aDiffNodesBuilder
	slotChanges associations with: aCollection
		do: [:slotDiff :node | slotDiff initializeSquotDiffNode: node with: aDiffNodesBuilder].