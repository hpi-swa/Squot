initialize-release
startFrom: working and: incoming basedOn: base
	walk addFirst: {working. incoming. base}.
	mirrors at: working put: (thisContext objectClass: working) squotMirror.
	mirrors at: incoming put: (thisContext objectClass: incoming) squotMirror.
	mirrors at: base put: (thisContext objectClass: base) squotMirror.