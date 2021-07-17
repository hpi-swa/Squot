private
applying: aReferenceDiff fill: valueShadow reachedVia: eachReference into: materialized reflectedIn: materializedMirror ifDeferredUntilActivated: deferredValueBlock ifNotTreatedYet: unavailableValueBlock
	"Answer whether the reference could already be filled in."
	| wasFilledIn |
	treatedObjects at: valueShadow undecorated
		ifPresent:
			[:materializedValue |
			(eachReference isHashRelevant and: [(self wasReactivated: materializedValue) not])
				ifTrue: ["Fill in later" wasFilledIn := false.
						deferredValueBlock value.
						(pendingIncomingReferencesForHash at: valueShadow undecorated ifAbsentPut: [OrderedCollection new])
							add: {materialized. materializedMirror. eachReference. aReferenceDiff}]
				ifFalse:
					[aReferenceDiff squotReflectOn: materialized in: materializedMirror withValue: materializedValue.
					wasFilledIn := true]]
		ifAbsent:
			[wasFilledIn := false.
			unavailableValueBlock value.
			eachReference isHashRelevant
				ifTrue:
					[(pendingIncomingReferencesForHash at: valueShadow undecorated ifAbsentPut: [OrderedCollection new])
						add: {materialized. materializedMirror. eachReference. aReferenceDiff}]
				ifFalse:
					[(pendingIncomingReferences at: valueShadow undecorated ifAbsentPut: [OrderedCollection new])
						add: {materialized. materializedMirror. eachReference. aReferenceDiff}]].
	^ wasFilledIn