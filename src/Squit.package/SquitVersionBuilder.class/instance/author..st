accessing
author: anObject
	anObject species = GitStamp
		ifTrue: [author := anObject]
		ifFalse: [author := GitStamp readFrom: (ReadStream on: anObject)]