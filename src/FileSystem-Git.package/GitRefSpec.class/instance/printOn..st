printing
printOn: aStream
	self areDestructiveUpdatesAllowed ifTrue:
		[aStream nextPut: $+].
	aStream nextPutAll: self leftRefPattern;
		nextPut: $:;
		nextPutAll: self rightRefPattern.