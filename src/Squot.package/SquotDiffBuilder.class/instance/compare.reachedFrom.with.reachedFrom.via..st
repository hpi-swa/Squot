private
compare: leftShadow reachedFrom: leftReferrer with: rightShadow reachedFrom: rightReferrer via: reference
	| diff |
	diff := objectDiffs at: leftShadow undecorated.
	"Give objects with intrinsic state a chance to compute the mutation."
	diff initializeFrom: leftShadow to: rightShadow.
	"For other objects, the evaluation of the references is the important part."
	walk followReferencesOf: leftShadow and: rightShadow
		ifDifferentShape:
			["Replaced or objects without modeled outgoing references."
			"Except for the start objects, this case was already handled in detectStartObjectReplacement:with:. Objects of different kinds must have different identities if they have any identity at all."
			| name |
			self assert: reference isNil. "May only happen with the start objects."
			name := shadowNames at: rightShadow undecorated.
			self searchFor: rightShadow
				named: name
				ifNew:
					[self addedObject: rightShadow withName: name reachedVia: nil.
					"Add to the walk again to get the addition in the graph diff."]
				ifFound:
					[:existing |
					existing undecorated ~= leftShadow 
						ifTrue: [self compareLater: existing with: rightShadow reachedVia: nil]]]
		ifFromBoth:
			[:leftValue :rightValue :commonPath |
			self addChangesTo: diff
				when: leftValue reachedFrom: leftShadow
				isDifferentFrom: rightValue reachedFrom: rightShadow 	via: commonPath last]
		ifOnlyLeft: [:removed :oldPath | "Reference was removed"
					diff addReferenceDiff:
						(SquotReferenceRemoval of: removed
							from: leftShadow reference: oldPath last
							rightObject: rightShadow)]
		ifOnlyRight: [:added :newPath | 
					"Reference was added. Target might be new too, but not necessarily."
					diff addReferenceDiff:
						(SquotReferenceAddition
							to: leftShadow reference: newPath last target: added
							rightOwner: rightShadow).
					self searchAndFollowOnce: added reachedVia: newPath last].