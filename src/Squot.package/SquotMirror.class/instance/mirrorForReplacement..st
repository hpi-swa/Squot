capturing
mirrorForReplacement: anObject
	"If a reflected object was replaced by anObject for capturing, another mirror might need to be used to reflect anObject. Answer that other mirror."
	^ (thisContext objectClass: anObject) squotMirror