private
fill: value reachedVia: eachReference into: materialized reflectedIn: materializedMirror ifDeferredUntilActivated: deferredValueBlock ifUnavailable: unavailableValueBlock
	"Answer whether the reference could already be filled in."
	| wasFilledIn |
	treatedObjects at: value undecorated
		ifPresent:
			[:materializedValue |
			(eachReference isHashRelevant and: [(self wasReactivated: materializedValue) not])
				ifTrue: ["Fill in later" wasFilledIn := false.
						deferredValueBlock value.
						(pendingIncomingReferencesForHash at: value undecorated ifAbsentPut: [OrderedCollection new])
							add: {materialized. materializedMirror. eachReference}]
				ifFalse:
					[eachReference asMaterializedReference reflect: materialized in: materializedMirror put: materializedValue.
					wasFilledIn := true]]
		ifAbsent:
			[wasFilledIn := false.
			unavailableValueBlock value.
			eachReference isHashRelevant
				ifTrue:
					[(pendingIncomingReferencesForHash at: value undecorated ifAbsentPut: [OrderedCollection new])
						add: {materialized. materializedMirror. eachReference}]
				ifFalse:
					[(pendingIncomingReferences at: value undecorated ifAbsentPut: [OrderedCollection new])
						add: {materialized. materializedMirror. eachReference}]].
	^ wasFilledIn