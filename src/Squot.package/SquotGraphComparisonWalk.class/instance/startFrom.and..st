initialize-release
startFrom: leftObject and: rightObject
	walk addFirst: {leftObject. rightObject}.
	mirrors at: leftObject put: (thisContext objectClass: leftObject) squotMirror.
	mirrors at: rightObject put: (thisContext objectClass: rightObject) squotMirror.