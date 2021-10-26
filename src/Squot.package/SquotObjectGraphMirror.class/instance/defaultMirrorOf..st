private
defaultMirrorOf: anObject
	"When I cannot determine the mirror to use for anObject by following references from objects with known mirrors, use a default mirror for the kind of anObject."
	^ anObject class squotMirror