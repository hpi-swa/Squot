private diffing
noteChangedReferrer: referringShadow via: aReference to: anUndecoratedShadow
	"Add a deep change for aSlot in the diff of referringShadow."
	(objectDiffs at: referringShadow undecorated)
		addTransitiveChangeIn: aReference.
	self noteChanged: referringShadow.