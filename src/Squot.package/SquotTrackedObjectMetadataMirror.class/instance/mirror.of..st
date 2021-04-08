reflection
mirror: aReference of: anObject
	| class mirror |
	"Treat all dictionaries as value dictionaries as well."
	class := thisContext objectClass: (self reflect: aReference of: anObject).
	mirror := class squotMirror.
	^ (mirror isMemberOf: SquotDictionaryMirror)
		ifTrue: [SquotTrackedObjectMetadataMirror class: class]
		ifFalse: [mirror]
	