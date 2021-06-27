private
materialize: aShadow in: anObject
	self flag: #deprecated. "References are filled in later now. See findOrCreateMaterializedInstanceOf: aShadow reflectedIn: aMirror".
	^ anObject