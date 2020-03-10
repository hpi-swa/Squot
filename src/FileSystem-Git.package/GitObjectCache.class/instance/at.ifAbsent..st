accessing
at: aHash ifAbsent: aBlock
	^ cache at: aHash ifAbsent: aBlock