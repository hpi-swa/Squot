accessing
shortName
	"Answers the more colloquial branch name without refs/heads or refs/remotes/."
	(self name beginsWith: 'refs/heads/')
		ifTrue: [^ self name allButFirst: 'refs/heads/' size].
	(self name beginsWith: 'refs/remotes/')
		ifTrue: [^ self name allButFirst: 'refs/remotes/' size].
	^ self name