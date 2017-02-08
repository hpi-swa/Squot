accessing
committer: anObject

	anObject species = GitStamp
		ifTrue: [committer := anObject]
		ifFalse: [committer readFrom: (ReadStream on: anObject)]