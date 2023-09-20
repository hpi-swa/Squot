comparing
= anObject
	^ super = anObject and: [self writerClass = anObject writerClass]