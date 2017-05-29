copying
updatedFromNodes
	^ self adjustedBy:
		(SquotDiffNode title: 'temporary root node' content: nil children: topNodes)