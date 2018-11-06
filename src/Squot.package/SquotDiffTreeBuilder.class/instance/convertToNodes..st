as yet unclassified
convertToNodes: aDiff
	| newNodes |
	nodes at: aDiff
		ifPresent: [:nodes | ^ nodes]
		ifAbsentPut: [newNodes := aDiff newSquotDiffNodes].
	newNodes ifNotEmpty: [aDiff initializeSquotDiffNodes: newNodes with: self].
	^ newNodes