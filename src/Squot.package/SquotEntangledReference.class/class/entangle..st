instance creation
entangle: aCollection
	"Answer an array of mutually entangled references, one for each reference in aCollection."
	| entangled |
	entangled := aCollection collect:
		[:each |
		self new
			setActualReference: each;
			yourself].
	entangled do:
		[:each | | others |
		others := Array new: aCollection size - 1 streamContents:
			[:stream | entangled do: [:eachOther | eachOther ~~ each ifTrue: [stream nextPut: eachOther]]].
		each setEntangledReferences: others].
	^ entangled