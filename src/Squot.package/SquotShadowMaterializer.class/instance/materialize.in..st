converting
materialize: aShadow in: anObject
	self flag: #deprecated. "References are filled in later now. See findOrCreateAndRematerialize: aShadow reflectedIn: aMirror".
	^ anObject