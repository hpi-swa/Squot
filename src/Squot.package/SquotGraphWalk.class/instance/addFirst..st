adding
addFirst: anObject
	self assert: toBeVisited isEmpty.
	self add: anObject path: #().