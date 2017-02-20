accessing
committerEmail: aString

	committer == author ifTrue: [committer := committer copy].
	committer email: aString.