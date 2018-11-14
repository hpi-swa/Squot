public-accessing-references
refName: refName forRemote: remoteName
	| branch |
	self validateReferenceOrReferenceName: refName.
	branch := (refName beginsWith: 'refs/heads/')
		ifTrue: [refName allButFirst: 'refs/heads/' size]
		ifFalse: [refName].
	self flag: 'TODO: adhere to fetch spec (remote.name.fetch)'.
	^ 'refs/remotes/', remoteName, '/', branch