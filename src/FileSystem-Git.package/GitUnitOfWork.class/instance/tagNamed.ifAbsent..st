branches and tags
tagNamed: aString ifAbsent: aBlock
	(self resolveRef: 'refs/tags/', aString) ifNotNil: [ :tagRef|
		 ^ self objectNamed: tagRef ifAbsent: aBlock ].
	^ aBlock value