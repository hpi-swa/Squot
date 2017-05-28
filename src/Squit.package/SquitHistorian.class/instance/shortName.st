accessing
shortName
	| shortHeadRef shortRemoteRef |
	(referenceName beginsWith: 'refs/heads/')
		ifTrue: [shortHeadRef := referenceName allButFirst: 'refs/heads/' size.
			(gitRepository refExists: shortHeadRef)
				ifFalse: [^ shortHeadRef]].
	(referenceName beginsWith: 'refs/remotes/')
		ifTrue: [shortRemoteRef := referenceName allButFirst: 'refs/remotes/' size.
			(gitRepository refExists: 'refs/heads/', shortRemoteRef)
				ifFalse: [^ shortRemoteRef]].
	^ referenceName