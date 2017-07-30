accessing
startObjectIfAbsent: aBlock
	^ objects at: self startName ifAbsent: aBlock