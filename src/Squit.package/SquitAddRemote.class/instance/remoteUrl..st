accessing
remoteUrl: anObject
	remoteUrl = anObject asString ifTrue: [^ self].
	remoteUrl := anObject asString.
	self changed: #remoteUrl.