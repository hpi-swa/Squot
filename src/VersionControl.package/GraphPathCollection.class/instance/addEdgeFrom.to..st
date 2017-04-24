as yet unclassified
addEdgeFrom: fromNode to: toNode
	paths keysAndValuesDo: [:target :dictionary |
		"dictionary stores the paths to target, each entry has the next node as value"
		"if there is no path from toNode to target, do not remember this edge for target"
		dictionary at: toNode ifPresent: [:x | dictionary at: fromNode put: toNode]].