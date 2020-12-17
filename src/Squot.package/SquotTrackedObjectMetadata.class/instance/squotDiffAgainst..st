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
			[| mirror leftClass rightClass leftRefs rightRefs |
			leftRefs := rightRefs := nil.
			leftClass := thisContext objectClass: left.
			rightClass := thisContext objectClass: right.
			(leftClass ~= rightClass
					or: [(leftRefs := (mirror := leftClass squotMirror) referencesFrom: left) isEmpty
						and: [(rightRefs := rightClass squotMirror referencesFrom: right) isEmpty]])
				ifTrue: [diffs at: (path at: encounter) put: (SquotObjectReplacement left: left right: right)]
				ifFalse: [
					((seen includes: left) or: [seen includes: right]) ifTrue: [self error: 'Multiple paths'].
					seen add: left; add: right.
					leftRefs ifNil: [leftRefs := mirror referencesFrom: left].
					rightRefs ifNil: [rightRefs := mirror referencesFrom: right].
					(leftRefs intersection: rightRefs) do:
						[:each |
						upcoming add: {each reflect: left in: mirror. each reflect: right in: mirror}.
						path at: upcoming last put: ((path at: encounter) copyWith: each)].
					(leftRefs copyWithoutAll: rightRefs) do:
						[:each | diffs at: ((path at: encounter) copyWith: each) put: (SquotObjectRemoval of: (each reflect: left in: mirror))].
					(rightRefs copyWithoutAll: leftRefs) do:
						[:each | diffs at: ((path at: encounter) copyWith: each) put: (SquotObjectAddition of: (each reflect: right in: mirror))]]]].
	^ SquotTrackedObjectMetadataDiff left: self right: aTrackedObjectMetadata diffs: diffs