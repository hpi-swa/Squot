initialize-release
startFrom: leftObject and: rightObject
	walk addFirst: {leftObject. rightObject}.
	mirrors at: leftObject undecorated put: (thisContext objectClass: leftObject undecorated) squotMirror.
	mirrors at: rightObject undecorated put: (thisContext objectClass: rightObject undecorated) squotMirror.