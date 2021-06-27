public
updateReferrersTo: materialized materializedFrom: aShadow
	"Update all known references to the new object where its hash does not matter. Reactivate each object that needs no more references to be filled in."
	(pendingIncomingReferences removeKey: aShadow undecorated ifAbsent: [#()]) do:
		[:eachTuple | | referrer mirror reference diff |
		referrer := eachTuple first. mirror := eachTuple second. reference := eachTuple third. diff := eachTuple fourth.
		self updateReference: reference from: referrer reflectedIn: mirror for: diff withValue: materialized].