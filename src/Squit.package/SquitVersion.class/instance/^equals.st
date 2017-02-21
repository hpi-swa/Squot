comparing
= anObject
	(anObject isMemberOf: self class) ifFalse: [^ false].
	^ anObject commit = commit