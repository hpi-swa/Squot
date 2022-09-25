private reflection
substituteMirrorOf: anObject reachedVia: aReference from: referrerObject
	| class mirror |
	"Treat all subcollections as values as well."
	class := thisContext objectClass: anObject.
	mirror := class squotMirror.
	(mirror isMemberOf: SquotDictionaryMirror) ifTrue: [^ SquotTrackedObjectMetadataMirror class: class].
	(mirror isMemberOf: SquotLookupKeyMirror) ifTrue: [^ SquotTrackedObjectMetadataLookupKeyMirror newFrom: mirror].
	(class isBits not and: [class canUnderstand: #from:to:do:]) ifTrue: [^ SquotTrackedObjectMetadataSequenceMirror class: class].
	^ mirror