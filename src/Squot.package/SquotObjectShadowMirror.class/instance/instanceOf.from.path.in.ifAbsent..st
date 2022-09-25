accessing
instanceOf: anObject from: sourceShadowGraph path: aSequencebleCollection in: searchShadowGraph ifAbsent: absentBlock
	^ anObject sameIn: searchShadowGraph asIn: sourceShadowGraph ifAbsent: absentBlock