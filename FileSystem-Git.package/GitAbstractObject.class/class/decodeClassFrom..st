accessing
decodeClassFrom: anObject
	^ self allSubclasses 
		detect: [ :class | class canDecode: anObject ]
		ifNone: [ GitInvalidObjectError signal: 'no class could decode ', anObject asString ]