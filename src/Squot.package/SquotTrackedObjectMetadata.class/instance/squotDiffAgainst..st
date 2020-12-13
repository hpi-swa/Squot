comparing
squotDiffAgainst: aTrackedObjectMetadata
	| seen upcoming path diffs |
	seen := IdentitySet new.
	upcoming := OrderedCollection new.
	upcoming add: {self. aTrackedObjectMetadata}.
	path := Dictionary new.
	path at: upcoming first put: #().
	diffs := Dictionary new.
	[upcoming isEmpty] whileFalse:
		[| encounter left right |
		encounter := upcoming removeLast.
		left := encounter first. right := encounter second.
		left ~= right ifTrue:
			[(left outboundPointers size = 1 and: [right outboundPointers size = 1])
				ifTrue: [diffs at: (path at: encounter) put: (SquotObjectReplacement left: left right: right)]
				ifFalse: [| leftClass rightClass leftSize rightSize |
					((seen includes: left) or: [seen includes: right]) ifTrue: [self error: 'Multiple paths'].
					seen add: left; add: right.
					leftClass := thisContext objectClass: left.
					rightClass := thisContext objectClass: right.
					((leftClass includesBehavior: Dictionary) and: [rightClass includesBehavior: Dictionary])
						ifTrue:
							[left keysAndValuesDo:
								[:eachKey :leftValue |
								(right includesKey: eachKey)
									ifTrue: [upcoming add: {leftValue. right at: eachKey}.
											path at: upcoming last put: ((path at: encounter) copyWith: (Message selector: #at: argument: eachKey))]
									ifFalse: [diffs at: ((path at: encounter) copyWith: (Message selector: #at: argument: eachKey)) put: (SquotObjectRemoval of: leftValue)]].
							right keysAndValuesDo:
								[:eachKey :rightValue |
								(left includesKey: eachKey)
									ifFalse: [diffs at: ((path at: encounter) copyWith: (Message selector: #at: argument: eachKey)) put: (SquotObjectAddition of: rightValue)]]]
						ifFalse:
							[leftClass ~= rightClass
								ifTrue: [diffs at: (path at: encounter) put: (SquotObjectReplacement left: left right: right)]
								ifFalse:
									[(leftClass instVarNames intersection: rightClass instVarNames) do:
										[:each |
										upcoming add: {thisContext object: left instVarAt: (leftClass instVarIndexFor: each ifAbsent: []). thisContext object: right instVarAt: (rightClass instVarIndexFor: each ifAbsent: [])}.
										path at: upcoming last put: ((path at: encounter) copyWith: each)].
									leftSize := thisContext objectSize: left.
									rightSize := thisContext objectSize: right.
									1 to: (leftSize min: rightSize) do:
										[:eachIndex |
										upcoming add: {thisContext object: left basicAt: eachIndex. thisContext object: right basicAt: eachIndex}.
										path at: upcoming last put: ((path at: encounter) copyWith: eachIndex)].
									rightSize + 1 to: leftSize do:
										[:eachIndex | diffs at: ((path at: encounter) copyWith: eachIndex) put: (SquotObjectRemoval of: (thisContext object: left basicAt: eachIndex))].
									leftSize +1 to: rightSize do:
										[:eachIndex | diffs at: ((path at: encounter) copyWith: eachIndex) put: (SquotObjectAddition of: (thisContext object: right basicAt: eachIndex))]]]]]].
	^ SquotTrackedObjectMetadataDiff left: self right: aTrackedObjectMetadata diffs: diffs