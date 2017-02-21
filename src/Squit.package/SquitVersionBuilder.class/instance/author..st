accessing
author: anObject
	anObject species = GitStamp
		ifTrue: [author := anObject]
		ifFalse: [author readFrom: (ReadStream on: anObject)]