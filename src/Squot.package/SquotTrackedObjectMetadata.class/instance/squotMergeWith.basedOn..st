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
			[| leftClass rightClass baseClass leftRefs rightRefs baseRefs mirror |
			leftRefs := rightRefs := baseRefs := nil.
			leftClass := thisContext objectClass: left.
			rightClass := thisContext objectClass: right.
			baseClass := thisContext objectClass: base.
			(leftClass ~= rightClass
					or: [(leftRefs := (mirror := leftClass squotMirror) referencesFrom: left) isEmpty
						and: [(rightRefs := rightClass squotMirror referencesFrom: right) isEmpty]])
				ifTrue:
					[base = left
						ifTrue: [diffs at: (path at: encounter) put: (SquotObjectReplacement left: left right: right)]
						ifFalse: [conflicts at: (path at: encounter) put: (SquotObjectReferenceConflict key: (path at: encounter) base: base working: left incoming: right)]]
				ifFalse: 
					[((seen includes: left) or: [(seen includes: right) or: [seen includes: base]]) ifTrue: [self error: 'Multiple paths'].
					seen add: left; add: right; add: base.
					leftRefs ifNil: [leftRefs := mirror referencesFrom: left].
					rightRefs ifNil: [rightRefs := mirror referencesFrom: right].
					baseRefs := baseClass = leftClass
								ifTrue: [mirror referencesFrom: base]
								ifFalse: [baseClass squotMirror referencesFrom: base].
					(leftRefs intersection: rightRefs) do:
						[:each |
						(baseRefs includes: each)
							ifTrue:
								[upcoming add: {(each reflect: left in: mirror). (each reflect: right in: mirror). (each reflect: base in: mirror)}.
								path at: upcoming last put: ((path at: encounter) copyWith: each)]
							ifFalse:
								["Would have to go into detail with the differences here and each of them would be conflicts"
								(each reflect: left in: mirror) = (each reflect: right in: mirror)
									ifTrue: ["in agreement"]
									ifFalse: [conflicts at: ((path at: encounter) copyWith: each) put: (SquotObjectAdditionConflict left: (each reflect: left in: mirror) right: (each reflect: right in: mirror))]]].
					(leftRefs copyWithoutAll: rightRefs) do:
						[:each |
						(baseRefs includes: each)
							ifFalse: ["leave added"]
							ifTrue:
								[(each reflect: base in: mirror) = (each reflect: left in: mirror)
									ifTrue: [diffs at: ((path at: encounter) copyWith: each) put: (SquotObjectRemoval of: (each reflect: left in: mirror))]
									ifFalse: [conflicts at: ((path at: encounter) copyWith: each) put: (SquotObjectReferenceConflict key: ((path at: encounter) copyWith: each) base: (each reflect: base in: mirror) working: (each reflect: left in: mirror) incoming: nil)]]].
					(rightRefs copyWithoutAll: leftRefs) do:
						[:each |
						(baseRefs includes: each)
							ifTrue:
								[(each reflect: right in: mirror) = (each reflect: base in: mirror)
									ifTrue: ["leave removed"]
									ifFalse: [conflicts at: ((path at: encounter) copyWith: each) put: (SquotObjectReferenceConflict key: ((path at: encounter) copyWith: each) base: (each reflect: base in: mirror) working: nil incoming: (each reflect: right in: mirror))]]
							ifFalse: [diffs at: ((path at: encounter) copyWith: each) put: (SquotObjectAddition of: (each reflect: right in: mirror))]]]]].
	^ SquotTrackedObjectMetadataMerge into: self merge: incomingTrackedObjectMetadata basedOn: baseTrackedObjectMetadata diffs: diffs conflicts: conflicts