accessing
absent: shadowObject
	"Answer a cached absent shadow for the given shadow object."
	self isThisEverCalled.
	absentShadows ifNil: [absentShadows := Dictionary new].
	^ absentShadows
		at: ((shadowObject respondsTo: #originalClass) ifTrue: [shadowObject originalClass] ifFalse: [shadowObject])
		ifAbsentPut: [| absentShadow |
			absentShadow := shadowObject squotAbsentContent.
			absentShadow == SquotAbsentValue instance
				ifTrue: [^ absentShadow "do not cache this"].
			absentShadow].