public-accessing-objects
sizeOfObjectNamed: aHash ifAbsent: aBlock
	^ (self headerOfObjectNamed: aHash ifAbsent: [^ aBlock value]) objectSize