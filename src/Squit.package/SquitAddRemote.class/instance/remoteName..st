accessing
remoteName: anObject

	remoteName = anObject ifTrue: [^ self].
	remoteName := anObject.
	self changed: #remoteName.