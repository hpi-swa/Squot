resolving
resolveString: aString 
	| decoded fs |
	decoded := (FilePath pathName: aString isEncoded: true) asSqueakPathName.
	fs := FSFilesystem disk.
	^ FSReference
		filesystem: fs
		path: (fs pathFromString: decoded)