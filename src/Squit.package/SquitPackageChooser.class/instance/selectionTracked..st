accessing
selectionTracked: aNumber

	selectionTracked := aNumber.
	self changed: #selectionTracked.
	self changed: #hasTrackedSelection