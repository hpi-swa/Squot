merging
squotMergeWith: incomingTrackedObjectMetadata basedOn: baseTrackedObjectMetadata
	| seen upcoming path diffs conflicts |
	seen := IdentitySet new.
	upcoming := OrderedCollection new.
	upcoming add: {self. incomingTrackedObjectMetadata. baseTrackedObjectMetadata}.
	path := Dictionary new.
	path at: upcoming first put: #().
	diffs := Dictionary new.
	conflicts := Dictionary new.
	[upcoming isEmpty] whileFalse:
		[| encounter left right base |
		encounter := upcoming removeLast.
		left := encounter first. right := encounter second. base := encounter third.
		left ~= right ifTrue:
			[(left outboundPointers size = 1 and: [right outboundPointers size = 1])
				ifTrue:
					[base = left
						ifTrue: [diffs at: (path at: encounter) put: (SquotObjectReplacement left: left right: right)]
						ifFalse: [conflicts at: (path at: encounter) put: (SquotObjectReferenceConflict key: (path at: encounter) base: base working: left incoming: right)]]
				ifFalse: [| leftClass rightClass baseClass leftSize rightSize baseSize |
					((seen includes: left) or: [(seen includes: right) or: [seen includes: base]]) ifTrue: [self error: 'Multiple paths'].
					seen add: left; add: right; add: base.
					leftClass := thisContext objectClass: left.
					rightClass := thisContext objectClass: right.
					baseClass := thisContext objectClass: base.
					((leftClass includesBehavior: Dictionary) and: [rightClass includesBehavior: Dictionary])
						ifTrue:
							[| baseIsDictionary | baseIsDictionary := baseClass includesBehavior: Dictionary.
							left keysAndValuesDo:
								[:eachKey :leftValue |
								(right includesKey: eachKey)
									ifTrue:
										[(baseIsDictionary and: [base includesKey: eachKey])
											ifTrue: [upcoming add: {leftValue. right at: eachKey. base at: eachKey}.
												path at: upcoming last put: ((path at: encounter) copyWith: (Message selector: #at: argument: eachKey))]
											ifFalse: [conflicts at: ((path at: encounter) copyWith: (Message selector: #at: argument: eachKey)) put: (SquotObjectReferenceConflict key: ((path at: encounter) copyWith: (Message selector: #at: argument: eachKey)) base: nil working: leftValue incoming: (right at: eachKey))]]
									ifFalse:
										[(baseIsDictionary and: [base includesKey: eachKey])
											ifTrue:
												[(base at: eachKey) = leftValue
													ifTrue: [diffs at: ((path at: encounter) copyWith: (Message selector: #at: argument: eachKey)) put: (SquotObjectRemoval of: leftValue)]
													ifFalse: [conflicts at: ((path at: encounter) copyWith: (Message selector: #at: argument: eachKey)) put: (SquotObjectReferenceConflict key: ((path at: encounter) copyWith: (Message selector: #at: argument: eachKey)) base: (base at: eachKey) working: leftValue incoming: nil)]]
											ifFalse: [conflicts at: ((path at: encounter) copyWith: (Message selector: #at: argument: eachKey)) put: (SquotObjectReferenceConflict key: ((path at: encounter) copyWith: (Message selector: #at: argument: eachKey)) base: nil working: leftValue incoming: nil)]]].
							right keysAndValuesDo:
								[:eachKey :rightValue |
								(left includesKey: eachKey) ifFalse:
									[(baseIsDictionary and: [base includesKey: eachKey])
										ifTrue:
											[(base at: eachKey) = rightValue
												ifTrue: ["leave removed"]
												ifFalse: [conflicts at: ((path at: encounter) copyWith: (Message selector: #at: argument: eachKey)) put: (SquotObjectReferenceConflict key: ((path at: encounter) copyWith: (Message selector: #at: argument: eachKey)) base: (base at: eachKey) working: nil incoming: rightValue)]]
										ifFalse: [diffs at: ((path at: encounter) copyWith: (Message selector: #at: argument: eachKey)) put: (SquotObjectAddition of: rightValue)]]]]
						ifFalse:
							[leftClass ~= rightClass
								ifTrue:
									[(baseClass = leftClass and: [base = left])
										ifTrue: [diffs at: (path at: encounter) put: (SquotObjectReplacement left: left right: right)]
										ifFalse: [conflicts at: (path at: encounter) put: (SquotObjectReferenceConflict key: (path at: encounter) base: base working: left incoming: right)]]
								ifFalse:
									[(leftClass instVarNames intersection: rightClass instVarNames) do:
										[:each |
										(baseClass instVarNames includes: each)
											ifTrue: 
												[upcoming add: {thisContext object: left instVarAt: (leftClass instVarIndexFor: each ifAbsent: []). thisContext object: right instVarAt: (rightClass instVarIndexFor: each ifAbsent: []). thisContext object: base instVarAt: (baseClass instVarIndexFor: each ifAbsent: [])}.
												path at: upcoming last put: ((path at: encounter) copyWith: each)]
											ifFalse:
												["Would have to go into detail with the differences here and each of them would be conflicts"
												(thisContext object: left instVarAt: (leftClass instVarIndexFor: each ifAbsent: [])) ~= (thisContext object: right instVarAt: (rightClass instVarIndexFor: each ifAbsent: []))
													ifTrue: [conflicts at: ((path at: encounter) copyWith: each) put: (SquotObjectAdditionConflict left: (thisContext object: left instVarAt: (leftClass instVarIndexFor: each ifAbsent: [])) right: (thisContext object: right instVarAt: (rightClass instVarIndexFor: each ifAbsent: [])))]]].
									leftSize := thisContext objectSize: left.
									rightSize := thisContext objectSize: right.
									baseSize := thisContext objectSize: base.
									1 to: (leftSize min: rightSize) do:
										[:eachIndex |
										eachIndex <= baseSize
											ifTrue:
												[upcoming add: {thisContext object: left basicAt: eachIndex. thisContext object: right basicAt: eachIndex}.
												path at: upcoming last put: ((path at: encounter) copyWith: eachIndex)]
											ifFalse:
												[(thisContext object: left basicAt: eachIndex) ~= (thisContext object: right basicAt: eachIndex)
													ifTrue: [conflicts at: ((path at: encounter) copyWith: eachIndex) put: (SquotObjectAdditionConflict left: (thisContext object: left basicAt: eachIndex) right: (thisContext object: right basicAt: eachIndex))]]].
									rightSize + 1 to: leftSize do:
										[:eachIndex |
										eachIndex <= baseSize
											ifTrue: [diffs at: ((path at: encounter) copyWith: eachIndex) put: (SquotObjectRemoval of: (thisContext object: left basicAt: eachIndex))]
											ifFalse: ["leave added"]].
									leftSize +1 to: rightSize do:
										[:eachIndex |
										eachIndex <= baseSize
											ifTrue: [(thisContext object: base basicAt: eachIndex) ~= (thisContext object: right basicAt: eachIndex)
														ifTrue: [conflicts at: ((path at: encounter) copyWith: eachIndex) put: (SquotObjectReferenceConflict key: ((path at: encounter) copyWith: eachIndex) base: (thisContext object: base basicAt: eachIndex) working: nil incoming: (thisContext object: right basicAt: eachIndex))]
														ifFalse: ["leave removed"]]
											ifFalse: [diffs at: ((path at: encounter) copyWith: eachIndex) put: (SquotObjectAddition of: (thisContext object: right basicAt: eachIndex))]]]]]]].
	^ SquotTrackedObjectMetadataMerge into: self merge: incomingTrackedObjectMetadata basedOn: baseTrackedObjectMetadata diffs: diffs conflicts: conflicts