private diffing
noteChangedReferrer: referringShadow via: aSlot to: anUndecoratedShadow
	"Add a deep change for aSlot in the diff of referringShadow."
	(self diffFrom: referringShadow to: referringShadow
		ifNew: [referringShadow diffClass new]
		andInitialize: [])
		addTransitiveChangeIn: aSlot.
	self noteChanged: referringShadow.