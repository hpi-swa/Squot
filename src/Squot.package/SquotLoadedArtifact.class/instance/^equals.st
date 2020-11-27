comparing
= anObject
	anObject == self ifTrue: [^ true].
	^ anObject = artifact "delegate to SquotLiveArtifact"