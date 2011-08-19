instance creation
readFrom: aStream delimiter: aCharacter 
	"Answer a path composed of several elements delimited by aCharacter"
	
	| elements out ch |
	aStream atEnd
		ifTrue: [ ^ self root ].
		
	elements := OrderedCollection new.
	out := (String new: 10) writeStream.
	[ aStream atEnd ] whileFalse: 
		[ ch := aStream next.
		ch = aCharacter 
			ifFalse: [ out nextPut: ch ]
			ifTrue: [ 
				elements add: out contents.
				out := (String new: 10) writeStream ] ].
	elements add: out contents.
	^ self withAll: (self canonicalizeElements: elements)