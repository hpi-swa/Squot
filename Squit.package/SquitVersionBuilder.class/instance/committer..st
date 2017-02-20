accessing
committer: anObject
	"committer is initially the same instance as author.
	If the committer is altered, create an own instance for it
	(i. e., assume author and committer are different individuals)."
	anObject species = GitStamp
		ifTrue: [committer := anObject]
		ifFalse: [committer := GitStamp readFrom: (ReadStream on: anObject)]