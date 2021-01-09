comparing
squotDiffAgainst: aTrackedObjectMetadata
	| walk diffs |
	diffs := Dictionary new.
	walk := SquotGraphComparisonWalk startingFrom: self and: aTrackedObjectMetadata.
	walk do:
		[:left :right :leftReferrer :rightReferrer |
		walk followReferencesOf: left and: right
			ifDifferentShape: [:path | diffs at: path put: (SquotReferenceTargetExchange reference: path last leftOwner: leftReferrer target: left rightOwner: rightReferrer target: right)]
			ifOnlyLeft: [:removed :path | diffs at: path put: (SquotReferenceRemoval from: left reference: path last rightObject: right)]
			ifOnlyRight: [:added :path | diffs at: path put: (SquotReferenceAddition to: left reference: path last target: added rightOwner: right)]
			ifAlreadyVisited: [self error: 'Multiple paths']].
	^ SquotTrackedObjectMetadataDiff left: self right: aTrackedObjectMetadata diffs: diffs