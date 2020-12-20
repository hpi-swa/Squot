comparing
squotDiffAgainst: aTrackedObjectMetadata
	| walk diffs |
	diffs := Dictionary new.
	walk := SquotGraphComparisonWalk startingFrom: self and: aTrackedObjectMetadata.
	walk do:
		[:left :right |
		walk followReferencesOf: left and: right
			ifDifferentShape: [:path | diffs at: path put: (SquotObjectReplacement left: left right: right)]
			ifOnlyLeft: [:removed :path | diffs at: path put: (SquotObjectRemoval of: removed)]
			ifOnlyRight: [:added :path | diffs at: path put: (SquotObjectAddition of: added)]
			ifAlreadyVisited: [self error: 'Multiple paths']].
	^ SquotTrackedObjectMetadataDiff left: self right: aTrackedObjectMetadata diffs: diffs