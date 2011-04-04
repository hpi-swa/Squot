converting
pathFromString: aString
	"Use the unix convention by default, since many filesystems are based on it."
	
	| in |
	in := aString readStream.
	^ in peek = $/ 
		ifTrue: 
			[in skip: 1.
			FSAbsolutePath readFrom: in delimiter: self delimiter]
		ifFalse:
			[FSRelativePath readFrom: in delimiter: self delimiter]