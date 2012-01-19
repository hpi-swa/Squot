instance creation
from: aString delimiter: aDelimiterCharacter 
	"Answer a path composed of several elements delimited by aCharacter"
	
	aString isEmpty
		ifTrue: [ ^ self root ].
	
	^ self withAll: (self canonicalizeElements: (aDelimiterCharacter split: aString))