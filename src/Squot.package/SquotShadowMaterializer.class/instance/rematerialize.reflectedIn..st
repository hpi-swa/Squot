public converting
rematerialize: aShadow reflectedIn: aMirror
	| materialized name materializedMirror remaining firstReferrer |
	convertedObjects at: aShadow undecorated ifPresent: [:it | ^ it].
	self assert: (aShadow hasSquotShadowName not or: [sourceGraph includesObjectNamed: aShadow name])
		description: 'Source graph does not contain shadow. Where does it come from?'.
	"Create instance or look up existing one."
	materialized := self findOrCreateAndRematerialize: aShadow reflectedIn: aMirror.
	convertedObjects at: aShadow undecorated put: materialized.
	"Update all known references to the new object. Reactivate each object that needs no more references to be filled in."
	(pendingReferences removeKey: aShadow undecorated ifAbsent: [#()]) do:
		[:eachTuple | | referrer mirror reference materializedReference |
		referrer := eachTuple first. mirror := eachTuple second. reference := eachTuple third.
		remaining := remainingReferences at: referrer.
		materializedReference := reference asMaterializedReference.
		materializedReference reflect: referrer in: mirror put: materialized.
		firstReferrer ifNil: [firstReferrer := {referrer. mirror. materializedReference}].
		remaining remove: reference.
		remaining ifEmpty:
			["Reactivate object if all references are filled in now."
			self reactivate: referrer.
			remainingReferences removeKey: referrer]].
	"Determine correct mirror to use for the materialized object."
	materializedMirror :=
		firstReferrer
			ifNil: [materialized class squotMirror]
			ifNotNil:
				[ | referrerMirror materializedReferrer reference |
				materializedReferrer := firstReferrer first.
				referrerMirror := firstReferrer second.
				reference := firstReferrer third.
				referrerMirror mirror: reference of: materializedReferrer].
	"Fill in all references of the new object whose value has already been materialized. Remember the other references to update them later."
	remaining := OrderedCollection new.
	(aMirror referencesFrom: aShadow) do:
		[:eachReference | | value | value := eachReference reflect: aShadow in: aMirror.
		convertedObjects at: value undecorated
			ifPresent:
				[:materializedValue |
				eachReference asMaterializedReference reflect: materialized in: materializedMirror put: materializedValue]
			ifAbsent:
				[walk add: value -> (aMirror mirror: eachReference of: aShadow) reachedVia: eachReference.
				remaining add: eachReference.
				(pendingReferences at: value undecorated ifAbsentPut: [OrderedCollection new])
					add: {materialized. materializedMirror. eachReference}]].
	remaining
		ifEmpty: 
			["Reactivate object if all references are filled in already."
			self reactivate: materialized]
		ifNotEmpty: [remainingReferences at: materialized put: remaining].
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