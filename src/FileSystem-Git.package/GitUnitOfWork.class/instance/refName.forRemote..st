remotes
refName: refName forRemote: remoteName
	| branch |
	repository validateReferenceOrReferenceName: refName.
	branch := (refName beginsWith: 'refs/heads/')
		ifTrue: [refName allButFirst: 'refs/heads/' size]
		ifFalse: [refName].
	self flag: 'TODO: adhere to fetch spec (remote.name.fetch)'.
	^ 'refs/remotes/', remoteName, '/', branch