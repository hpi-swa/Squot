public
applying: aReferenceDiff fill: value reachedVia: eachReference into: materialized reflectedIn: materializedMirror ifDeferredUntilActivated: deferredValueBlock ifNotTreatedYet: unavailableValueBlock
	"Answer whether the reference could already be filled in."
	| wasFilledIn |
	treatedObjects at: value undecorated
		ifPresent:
			[:materializedValue |
			(eachReference isHashRelevant and: [(self wasReactivated: materializedValue) not])
				ifTrue: ["Fill in later" wasFilledIn := false.
						deferredValueBlock value.
						(pendingIncomingReferencesForHash at: value undecorated ifAbsentPut: [OrderedCollection new])
							add: {materialized. materializedMirror. eachReference. aReferenceDiff}]
				ifFalse:
					[aReferenceDiff squotReflectOn: materialized in: materializedMirror withValue: materializedValue.
					wasFilledIn := true]]
		ifAbsent:
			[wasFilledIn := false.
			unavailableValueBlock value.
			eachReference isHashRelevant
				ifTrue:
					[(pendingIncomingReferencesForHash at: value undecorated ifAbsentPut: [OrderedCollection new])
						add: {materialized. materializedMirror. eachReference. aReferenceDiff}]
				ifFalse:
					[(pendingIncomingReferences at: value undecorated ifAbsentPut: [OrderedCollection new])
						add: {materialized. materializedMirror. eachReference. aReferenceDiff}]].
	^ wasFilledIn