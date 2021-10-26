reflection
mirrorOf: anObject reachedVia: aReference from: referrerObject
	"Answer the mirror to reflect anObject as the value of aReference in referrerObject."
	^ (thisContext objectClass: anObject) squotMirror
	