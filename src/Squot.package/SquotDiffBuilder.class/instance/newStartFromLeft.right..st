diffing high-level
newStartFromLeft: leftStartShadow right: rightStartShadow
	"Walk the two object graphs and record the differences. Answer the graph diff."
	"The first objects always get a name, so that their diff can be found in the graph diff. If the first objects have different identities, a SquotObjectReplacement is recorded as their diff. Otherwise the references of each pair of encountered object are followed and if the values of the references have been reassigned, diffs are created for the referrers and reference diffs are added to them. If references have been added or removed, this is also added to the diff of the referrers. If a diff is created for a pair of objects, a diff is also created for the pair of referrers, noting that the object referred to has been changed somehow."
	| walk fallbackName |
	self initialize.
	graphDiff left: left; right: right.
	walk := SquotGraphComparisonWalk startingFrom: leftStartShadow and: rightStartShadow.
	fallbackName := ({rightStartShadow. leftStartShadow} detect: #hasSquotShadowName ifNone: [])
		ifNotNil: [:shadow | shadow name]
		ifNil: [SquotObjectCapturer new rootName].
	self rememberNameOf: leftStartShadow orAssume: [fallbackName].
	self rememberNameOf: rightStartShadow orAssume: [fallbackName].
	(shadowNames at: leftStartShadow undecorated) ~= (shadowNames at: rightStartShadow undecorated)
		ifTrue:
			["Start objects have different identities."
			| newName diff |
			newName := shadowNames at: rightStartShadow undecorated.
			diff := self diffFrom: leftStartShadow to: rightStartShadow
				ifNew: [SquotObjectReplacement left: leftStartShadow right: rightStartShadow]
				andInitialize: []].
	walk do:
		[:leftShadow :rightShadow :leftReferrer :rightReferrer :path | | reference |
		reference := path ifNotEmpty: [path last].
		diffedPair := leftShadow -> rightShadow.
		leftShadow
			ifNil: "Walking via a new object that did not exist in the old graph."
				[walk followReferencesOfNewObject: rightShadow do: 
					[:value :newPath | | alreadyVisited |
					alreadyVisited := false.
					walk checkPathsTo: value ifMultiple: [alreadyVisited := true].
					alreadyVisited ifFalse:
						[| existing name |
						name := self rememberNameOf: value.
						existing := value sameIn: left asIn: right ifAbsent: [].
						existing
							ifNil:
								[self addedObject: value withName: name.
								walk addNewObject: value reachedVia: newPath last]
							ifNotNil: [walk addLeft: existing right: value reachedVia: newPath last]]]]
			ifNotNil: "Comparing two objects with the same identity (except for the start objects which might still have different identities)."
				[| diff |
				"Give objects with intrinsic state a chance to compute the mutation."
				diff := leftShadow squotDiffAgainst: rightShadow with: self.
				"For other objects, the evaluation of the references is the important part."
				walk followReferencesOf: leftShadow and: rightShadow
					ifDifferentShape:
						["Replaced or objects without modeled outgoing references."
						"Except for the start objects, this case was already handled when the names of the shadows were different before they were added to the walk. Objects of different kinds must have different identities if they have any identity at all."
						| existing name |
						self assert: path isEmpty. "May only happen with the start objects."
						name := shadowNames at: rightShadow undecorated.
						existing := rightShadow sameIn: left asIn: right ifAbsent: [].
						existing
							ifNil:
								[self addedObject: rightShadow withName: name.
								"Add to the walk again to get the addition in the graph diff."
								walk addNewObject: rightShadow reachedVia: nil]
							ifNotNil:
								[existing undecorated ~= leftShadow 
									ifTrue: [walk addLeft: existing right: rightShadow reachedVia: nil]]]
					ifFromBoth:
						[:leftValue :rightValue :commonPath | | rightName |
						self rememberNameOf: leftValue.
						rightName := self rememberNameOf: rightValue.
						(shadowNames at: leftValue undecorated ifAbsent: [1])
						= (shadowNames at: rightValue undecorated ifAbsent: [2])
							ifTrue: "The reference itself did not change, but we might later find out that the value has some differences."
								[| alreadyVisited |
								alreadyVisited := false.
								walk checkPathsTo: leftValue ifMultiple: [alreadyVisited := true].
								alreadyVisited
									ifTrue:
										[(objectsWithChanges includes: leftValue undecorated)
											ifTrue: [diff	addReferenceDiff:
														(SquotDifferentReferenceTarget
															reference: commonPath last
															leftOwner: leftShadow target: leftValue
															rightOwner: rightShadow target: rightValue)]]
									ifFalse: "left object not visited yet"
										[walk addLeft: leftValue right: rightValue reachedVia: commonPath last]]
							ifFalse: "Reference was reassigned to a different object or the targets are value objects."
								[leftValue = rightValue ifFalse:
									[diff addReferenceDiff:
										(SquotReferenceTargetExchange
											reference: commonPath last
											leftOwner: leftShadow target: leftValue
											rightOwner: rightShadow target: rightValue)]].
						rightValue sameIn: left asIn: right ifAbsent:
							[| alreadyVisited |
							alreadyVisited := false.
							walk checkPathsTo: rightValue ifMultiple: [alreadyVisited := true].
							alreadyVisited ifFalse:
								[self addedObject: rightValue withName: rightName.
								walk addNewObject: rightValue reachedVia: commonPath last]].
						(objectsWithChanges includes: leftValue undecorated) ifFalse:
							[(referrers at: leftValue undecorated ifAbsentPut: [OrderedCollection new])
								add: leftShadow -> commonPath last.
							(referrers at: rightValue undecorated ifAbsentPut: [OrderedCollection new])
								add: rightShadow -> commonPath last]]
					ifOnlyLeft: [:removed :oldPath | "Reference was removed"
								diff addReferenceDiff:
									(SquotReferenceRemoval of: removed
										from: leftShadow reference: oldPath last
										rightObject: rightShadow)]
					ifOnlyRight: [:added :newPath | | alreadyVisited |
								"Reference was added. Target might be new too, but not necessarily."
								diff addReferenceDiff:
									(SquotReferenceAddition
										to: leftShadow reference: newPath last target: added
										rightOwner: rightShadow).
								alreadyVisited := false.
								walk checkPathsTo: added ifMultiple: [alreadyVisited := true].
								alreadyVisited ifFalse:
									[| existing name |
									name := self rememberNameOf: added.
									existing := added sameIn: left asIn: right ifAbsent: [].
									existing
										ifNil:
											[self addedObject: added withName: name.
											walk addNewObject: added reachedVia: newPath last]
										ifNotNil: [walk addLeft: existing right: added reachedVia: newPath last]]]]].
	diffedPair := nil.
	(objectDiffs select: [:each | each squotHasChanges])
		keysAndValuesDo:
			[:shadow :diff |
			graphDiff addDiff: diff forObjectNamed: (left nameOf: shadow).
			self noteChanged: shadow].
	graphDiff startObjectName: (shadowNames at: leftStartShadow undecorated).
	^ graphDiff