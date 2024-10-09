adding
getTree: aString
	^ self children
		detect: [:each | each isTree and: [each ref beginsWith: ('{1}/{2}/' format: {self ref. aString})]]
		ifNone: [self addTree: aString]