converting
pathFromString: aString
	"Use the unix convention by default, since many filesystems are based on it."
	
	^ (aString first = $/ 
		ifTrue: [FSAbsolutePath]
		ifFalse:[FSRelativePath])
			 from: aString delimiter: self delimiter