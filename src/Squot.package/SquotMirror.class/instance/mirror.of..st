reflection
mirror: aReference of: anObject
	"Answer the mirror to reflect the target of aReference in anObject."
	self flag: #todo. "Using the mirroring primitive (objectClass:) but sending #undecorated to the object is somewhat ineffectual..."
	^ (thisContext objectClass: (self reflect: aReference of: anObject) undecorated) squotMirror
	