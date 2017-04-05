storing
storeLooseObject: aGitStorableObject
	| objectReference |
	objectReference := (self referenceTo: aGitStorableObject).
	objectReference exists ifTrue: [ ^ self ]. "prevent overwrites"
	
	objectReference writeStreamDo: [ :stream | 
		stream binary.
		aGitStorableObject compressedOn: stream ].
	objectCache at: aGitStorableObject hexHash put: aGitStorableObject.