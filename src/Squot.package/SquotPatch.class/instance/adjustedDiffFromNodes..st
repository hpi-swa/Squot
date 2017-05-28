as yet unclassified
adjustedDiffFromNodes: eachDiff
	eachDiff topNodes ifEmpty: [^ eachDiff].
	^ eachDiff adjustedBy:
		(SquotDiffNode title: 'temporary root node' content: nil children: eachDiff topNodes)