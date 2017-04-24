as yet unclassified
hasPathFrom: startNode toAnyOf: targetNodes
	^ targetNodes anySatisfy: [:any | self hasPathFrom: startNode to: any]