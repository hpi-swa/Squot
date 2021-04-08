reflection
mirror: aReference of: anObject
	"Answer the mirror to reflect the target of aReference in anObject."
	^ (thisContext objectClass: (self reflect: aReference of: anObject)) squotMirror
	