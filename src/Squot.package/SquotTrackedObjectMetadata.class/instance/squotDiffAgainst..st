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
				ifFalse: [| leftClass rightClass |
					((seen includes: left) or: [seen includes: right]) ifTrue: [self error: 'Multiple paths'].
					seen add: left; add: right.
					leftClass := thisContext objectClass: left.
					rightClass := thisContext objectClass: right.
					leftClass ~= rightClass
						ifTrue: [diffs at: (path at: encounter) put: (SquotObjectReplacement left: left right: right)]
						ifFalse:
							[| mirror refs | mirror := leftClass squotMirror.
							refs := {mirror referencesFrom: left. mirror referencesFrom: right}.
							(refs first intersection: refs second) do:
								[:each |
								upcoming add: {each reflect: left in: mirror. each reflect: right in: mirror}.
								path at: upcoming last put: ((path at: encounter) copyWith: each)].
							(refs first copyWithoutAll: refs second) do:
								[:each | diffs at: ((path at: encounter) copyWith: each) put: (SquotObjectRemoval of: (each reflect: left in: mirror))].
							(refs second copyWithoutAll: refs first) do:
								[:each | diffs at: ((path at: encounter) copyWith: each) put: (SquotObjectAddition of: (each reflect: right in: mirror))]]]]].
	^ SquotTrackedObjectMetadataDiff left: self right: aTrackedObjectMetadata diffs: diffs