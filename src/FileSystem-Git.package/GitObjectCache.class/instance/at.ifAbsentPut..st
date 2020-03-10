accessing
at: aHash ifAbsentPut: aBlock
	^ cache at: aHash ifAbsentPut: aBlock