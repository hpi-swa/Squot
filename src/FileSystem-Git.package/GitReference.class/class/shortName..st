name
shortName: aString
	"Answers the more colloquial branch name without refs/squeak, refs/heads or refs/remotes/."
	| name |
	name := aString.
	(name beginsWith: 'refs/squeak/')
		ifTrue: [name := (name allButFirst: 'refs/squeak/' size) copyAfter: $/].
	(name beginsWith: 'heads/')
		ifTrue: [^ name allButFirst: 'heads/' size].
	(name beginsWith: 'refs/heads/')
		ifTrue: [^ name allButFirst: 'refs/heads/' size].
	(name beginsWith: 'refs/remotes/')
		ifTrue: [^ name allButFirst: 'refs/remotes/' size].
	^ name