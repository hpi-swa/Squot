private
updateReference: reference from: referrer reflectedIn: mirror for: aDiff withValue: materialized
	"Update all known references to the new object where its hash does not matter. Reactivate each object that needs no more references to be filled in."
	| remaining |
	remaining := pendingOutgoingReferences at: referrer.
	aDiff squotReflectOn: referrer in: mirror withValue: materialized.
	remaining remove: reference.
	remaining ifEmpty:
		["Reactivate object if all references are filled in now."
		pendingOutgoingReferences removeKey: referrer.
		self reactivate: referrer].