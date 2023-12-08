refs
splitRemoteRef: aString
	| parts index remoteName remoteRef |
	self assert: (self isRemoteRef: aString) description: aString, ' is not a remote ref'.
	parts := aString allButFirst: self remoteRefBaseName size.
	index := parts indexOf: $/.
	self assert: index >= 1 description: aString, ' is not a valid remote ref'.
	remoteName := parts first: index - 1.
	remoteRef := parts allButFirst: index.
	^ remoteName -> remoteRef