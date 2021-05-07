as yet unclassified
convertToNodes: aDiff
	| newNodes |
	nodes at: aDiff
		ifPresent: [:existingNodes | ^ existingNodes]
		ifAbsentPut: [newNodes := aDiff newSquotDiffNodes].
	newNodes ifNotEmpty: [aDiff initializeSquotDiffNodes: newNodes with: self].
	^ newNodes