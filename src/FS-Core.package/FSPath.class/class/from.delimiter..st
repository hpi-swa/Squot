instance creation
from: aString delimiter: aDelimiterCharacter 
	"Answer a path composed of several elements delimited by aCharacter"
	| pathClass |
	aString isEmpty
		ifTrue: [ ^ self root ].
	
	pathClass :=  ((self isAbsoluteUnixPath: aString) or: [self isAbsoluteWindowsPath: aString]) 
		ifTrue: [ FSAbsolutePath ]
		ifFalse:[ FSRelativePath ].
	
	^ pathClass withAll: (pathClass canonicalizeElements: (aString splitBy: aDelimiterCharacter asString))