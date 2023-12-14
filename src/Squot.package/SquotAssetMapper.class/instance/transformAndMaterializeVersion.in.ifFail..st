ui
transformAndMaterializeVersion: anObject in: aWorkingCopy ifFail: aBlock
	self materialize: (self transformVersion: anObject ifFail: [^ aBlock value]) in: aWorkingCopy.