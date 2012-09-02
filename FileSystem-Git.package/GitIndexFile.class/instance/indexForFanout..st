accessing
indexForFanout: fanoutIndex
	fanoutIndex isZero ifTrue: [ ^ 0 ].
	^ fanoutTable unsignedLongAt: (fanoutIndex * 4) + 1 bigEndian: true.