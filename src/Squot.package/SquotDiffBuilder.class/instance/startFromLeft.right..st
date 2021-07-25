comparing
startFromLeft: leftStartShadow right: rightStartShadow
	"Walk the two object graphs and record the differences. Answer the graph diff."
	"The first objects always get a name, so that their diff can be found in the graph diff. If the first objects have different identities, a SquotObjectReplacement is recorded as their diff. Otherwise the references of each pair of encountered object are followed and if the values of the references have been reassigned, diffs are created for the referrers and reference diffs are added to them. If references have been added or removed, this is also added to the diff of the referrers. If a diff is created for a pair of objects, a diff is also created for the pair of referrers, noting that the object referred to has been changed somehow."
	self initialize.
	graphDiff left: left; right: right.
	walk := SquotGraphComparisonWalk startingFrom: leftStartShadow and: rightStartShadow.
	self rememberStartObjectNamesLeft: leftStartShadow right: rightStartShadow.
	self detectStartObjectReplacement: leftStartShadow with: rightStartShadow.
	walk
		newObjectsDo: "Walking via a new object that did not exist in the old graph."
			[:rightShadow :rightReferrer :path | self followNewObject: rightShadow]
		existingObjectsPairsDo: "Comparing two objects with the same identity (except for the start objects which might still have different identities)."
			[:leftShadow :rightShadow :leftReferrer :rightReferrer :path |
			self compare: leftShadow reachedFrom: leftReferrer
				with: rightShadow reachedFrom: rightReferrer
				via: (path ifEmpty: [] ifNotEmpty: [path last])].
	self addDiffsToGraphDiff.
	graphDiff startObjectName: (shadowNames at: leftStartShadow undecorated).
	^ graphDiff