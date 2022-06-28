comparing
squotDiffAgainst: aTrackedObjectMetadata
	| walk diff diffs |
	diffs := Dictionary new.
	walk := SquotGraphComparisonWalk new.
	diff := walk startFrom: self and: aTrackedObjectMetadata.
	walk checkPathsTo: self ifMultiple: [];
		checkPathsTo: aTrackedObjectMetadata ifMultiple: ["Same object." ^ SquotDiffOfEqualObjects instance].
	walk do:
		[:left :right :leftReferrer :rightReferrer :path |
			walk followReferencesOf: left and: right
				ifDifferentShape: [diffs at: path put: (SquotReferenceTargetExchange reference: path last leftOwner: leftReferrer target: left rightOwner: rightReferrer target: right)]
				ifFromBoth:
					[:leftValue :rightValue :commonPath | | alreadyVisited |
					alreadyVisited := false.
					walk checkPathsTo: leftValue ifMultiple: [alreadyVisited := true];
						checkPathsTo: rightValue ifMultiple: [alreadyVisited := true].
					alreadyVisited ifFalse: 
						[leftValue ~= rightValue ifTrue:
							[walk addLeft: leftValue right: rightValue reachedVia: commonPath last]]]
				ifOnlyLeft: [:removed :oldPath | diffs at: oldPath put: (SquotReferenceRemoval  of: removed from: left reference: oldPath last rightObject: right)]
				ifOnlyRight: [:added :newPath | diffs at: newPath put: (SquotReferenceAddition to: left reference: newPath last target: added rightOwner: right)]].
	diff setLeft: self right: aTrackedObjectMetadata diffs: diffs.
	^ diff