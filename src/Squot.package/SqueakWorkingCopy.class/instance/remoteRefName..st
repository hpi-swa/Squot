refs
remoteRefName: aString
	^ (aString allButFirst: self remoteRefBaseName size) copyAfter: $/