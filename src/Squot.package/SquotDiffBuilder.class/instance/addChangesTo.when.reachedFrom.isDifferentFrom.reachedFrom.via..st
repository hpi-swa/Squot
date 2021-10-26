private
addChangesTo: diff when: leftValue reachedFrom: leftShadow isDifferentFrom: rightValue reachedFrom: rightShadow via: aReference
	| rightName |
	self rememberNameOf: leftValue.
	rightName := self rememberNameOf: rightValue.
	(shadowNames at: leftValue undecorated ifAbsent: [1])
	= (shadowNames at: rightValue undecorated ifAbsent: [2])
		ifTrue: "The reference itself did not change, but we might later find out that the value has some differences."
			[| alreadyVisited |
			alreadyVisited := false.
			walk checkPathsTo: leftValue undecorated ifMultiple: [alreadyVisited := true].
			alreadyVisited
				ifTrue:
					[(objectsWithChanges includes: leftValue undecorated)
						ifTrue: [diff	addReferenceDiff:
									(SquotDifferentReferenceTarget
										reference: aReference
										leftOwner: leftShadow target: leftValue
										rightOwner: rightShadow target: rightValue)]]
				ifFalse: "left object not visited yet"
					[self compareLater: leftValue with: rightValue reachedVia: aReference]]
		ifFalse: "Reference was reassigned to a different object or the targets are value objects."
			[leftValue = rightValue ifFalse:
				[diff addReferenceDiff:
					(SquotReferenceTargetExchange
						reference: aReference
						leftOwner: leftShadow target: leftValue
						rightOwner: rightShadow target: rightValue)]].
	rightValue sameIn: left asIn: right ifAbsent:
		[| alreadyVisited |
		alreadyVisited := false.
		walk checkPathsTo: rightValue ifMultiple: [alreadyVisited := true].
		alreadyVisited ifFalse:
			[self addedObject: rightValue withName: rightName reachedVia: aReference]].
	(objectsWithChanges includes: leftValue undecorated) ifFalse:
		[(referrers at: leftValue undecorated ifAbsentPut: [OrderedCollection new])
			add: leftShadow -> aReference.
		(referrers at: rightValue undecorated ifAbsentPut: [OrderedCollection new])
			add: rightShadow -> aReference].