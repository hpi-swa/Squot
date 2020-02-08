accessing
next
	self atEnd ifTrue: [^ self errorNoMoreVersions].
	^ searchFrontier removeFirst object