accessing
indexForFanout: fanoutIndex
	fanoutIndex = 0 ifTrue: [ ^ 0 ].
	^ fanoutTable unsignedLongAt: (fanoutIndex * 4) + 1 bigEndian: true.