public-accessing-objects
tagNamed: aString ifAbsent: aBlock
	(self resolveRef: 'refs/tags/', aString) ifNotNilDo: [ :tagRef|
		 ^ self objectNamed: tagRef ifAbsent: aBlock ].
	^ aBlock value