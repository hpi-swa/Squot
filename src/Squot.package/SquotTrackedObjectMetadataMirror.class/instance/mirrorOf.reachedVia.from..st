reflection
mirrorOf: anObject reachedVia: aReference from: referrerObject
	| class mirror |
	"Treat all dictionaries as value dictionaries as well."
	class := thisContext objectClass: anObject.
	mirror := class squotMirror.
	^ (mirror isMemberOf: SquotDictionaryMirror)
		ifTrue: [SquotTrackedObjectMetadataMirror class: class]
		ifFalse: [mirror]