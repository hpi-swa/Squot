public converting
rematerialize: aShadow reflectedIn: aMirror
	| materialized name materializedMirror remaining firstReferrer |
	convertedObjects at: aShadow undecorated ifPresent: [:it | ^ it].
	self assert: (aShadow hasSquotShadowName not or: [sourceGraph includesObjectNamed: aShadow name])
		description: 'Source graph does not contain shadow. Where does it come from?'.
	"Create instance or look up existing one."
	materialized := self findOrCreateAndRematerialize: aShadow reflectedIn: aMirror.
	convertedObjects at: aShadow undecorated put: materialized.
	"Determine correct mirror to use for the materialized object."
	pendingReferences at: aShadow undecorated
		ifPresent:
			[:pending | | referrer mirror reference materializedReference |
			referrer := pending first first. mirror := pending first second. reference := pending first third.
			materializedReference := reference asMaterializedReference.
			firstReferrer := {referrer. mirror. materializedReference}]
		ifAbsent: [firstReferrer := nil].
	materializedMirror :=
		firstReferrer
			ifNil: [materialized class squotMirror]
			ifNotNil:
				[ | referrerMirror materializedReferrer reference |
				materializedReferrer := firstReferrer first.
				referrerMirror := firstReferrer second.
				reference := firstReferrer third.
				referrerMirror mirrorOf: materialized reachedVia: reference from: materializedReferrer].
	"Fill in all references of the new object whose value has already been materialized. Remember the other references to update them later."
	remaining := OrderedCollection new.
	(aMirror referencesFrom: aShadow) do:
		[:eachReference | | value | value := eachReference reflect: aShadow in: aMirror.
		convertedObjects at: value undecorated
			ifPresent:
				[:materializedValue |
				(eachReference isHashRelevant and: [(self wasReactivated: materializedValue) not])
					ifTrue: ["Fill in later"
							remaining add: eachReference.
							(pendingReferencesForHash at: value undecorated ifAbsentPut: [OrderedCollection new])
								add: {materialized. materializedMirror. eachReference}]
					ifFalse: [eachReference asMaterializedReference reflect: materialized in: materializedMirror put: materializedValue]]
			ifAbsent:
				[walk add: value -> (aMirror mirrorOf: (eachReference reflect: aShadow in: aMirror) undecorated reachedVia: eachReference from: aShadow) reachedVia: eachReference.
				remaining add: eachReference.
				eachReference isHashRelevant
					ifTrue:
						[(pendingReferencesForHash at: value undecorated ifAbsentPut: [OrderedCollection new])
							add: {materialized. materializedMirror. eachReference}]
					ifFalse:
						[(pendingReferences at: value undecorated ifAbsentPut: [OrderedCollection new])
							add: {materialized. materializedMirror. eachReference}]]].
	remaining
		ifEmpty: 
			["Reactivate object if all references are filled in already."
			self reactivate: materialized]
		ifNotEmpty: [remainingReferences at: materialized put: remaining].
	"Update all known references to the new object where its hash does not matter. Reactivate each object that needs no more references to be filled in."
	(pendingReferences removeKey: aShadow undecorated ifAbsent: [#()]) do:
		[:eachTuple | | referrer mirror reference materializedReference |
		referrer := eachTuple first. mirror := eachTuple second. reference := eachTuple third.
		remaining := remainingReferences at: referrer.
		materializedReference := reference asMaterializedReference.
		materializedReference reflect: referrer in: mirror put: materialized.
		remaining remove: reference.
		remaining ifEmpty:
			["Reactivate object if all references are filled in now."
			remainingReferences removeKey: referrer.
			self reactivate: referrer]].
	"Assign identifier if any."
	name := sourceGraph nameOf: aShadow undecorated ifAbsent: [].
	(name isNil and: [aShadow hasSquotShadowName])
		ifTrue: [name := aShadow name].
	(materializedMirror shouldObjectHaveNameAssigned: materialized)
		ifTrue:
			[name 
				ifNil: [self error: 'Object has no name but it should have']
				ifNotNil: [objectRegistry nameOf: materialized ifAbsentAssign: [name]]].
	name ifNotNil: [targetGraph assign: name to: materialized].
	^ materialized