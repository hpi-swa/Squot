storing
storeLooseObject: aGitStorableObject
	| objectReference |
	objectReference := (self referenceTo: aGitStorableObject).
	objectReference exists ifTrue: [ ^ self ]. "prevent overwrites"
	
	objectReference writeStreamDo: [ :stream | 
		self flag: 'TODO'. "Use proper streaming protocol here".
		"stream binary.
		aGitStorableObject compressedOn: stream"
		stream nextPutAll: aGitStorableObject compressed ]