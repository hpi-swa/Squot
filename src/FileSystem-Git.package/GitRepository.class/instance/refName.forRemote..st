public-accessing-references
refName: refName forRemote: remoteName
	| branch |
	branch := (refName beginsWith: 'refs/heads/')
		ifTrue: [refName allButFirst: 'refs/heads/' size]
		ifFalse: [refName].
	^ 'refs/remotes/', remoteName, '/', branch