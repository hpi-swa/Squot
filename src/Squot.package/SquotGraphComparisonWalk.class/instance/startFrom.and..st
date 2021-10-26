initialize-release
startFrom: leftObject and: rightObject
	| diff |
	walk addFirst: {leftObject. rightObject}.
	mirrors at: leftObject undecorated put: (thisContext objectClass: leftObject undecorated) squotMirror.
	mirrors at: rightObject undecorated put: (thisContext objectClass: rightObject undecorated) squotMirror.
	diff := (mirrors at: leftObject undecorated) newDiffFrom: leftObject to: rightObject.
	^ diff
