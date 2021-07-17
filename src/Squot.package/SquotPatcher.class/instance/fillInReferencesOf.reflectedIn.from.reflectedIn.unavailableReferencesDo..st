public
fillInReferencesOf: materialized reflectedIn: materializedMirror from: aShadow reflectedIn: aMirror unavailableReferencesDo: aBlock
	"Fill in all references of the new object whose values have already been materialized. Remember the other references to update them later."
	| remaining |
	remaining := OrderedCollection new.
	(aMirror referencesFrom: aShadow) do:
		[:eachReference | | value |
		value := eachReference reflect: aShadow in: aMirror.
		self fill: value reachedVia: eachReference
			into: materialized reflectedIn: materializedMirror
			ifDeferredUntilActivated: [remaining add: eachReference]
			ifUnavailable:
				[aBlock cull: eachReference cull: value.
				remaining add: eachReference]].
	remaining
		ifEmpty: 
			["Reactivate object if all references are filled in already."
			self reactivate: materialized]
		ifNotEmpty: [pendingOutgoingReferences at: materialized put: remaining].