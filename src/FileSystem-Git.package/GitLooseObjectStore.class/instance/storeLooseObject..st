private
storeLooseObject: aGitStorableObject
	| objectReference |
	objectReference := (self referenceTo: aGitStorableObject).
	objectReference exists ifTrue: [ ^ self ]. "prevent overwrites"
	
	objectReference writeStreamDo: [ :stream | 
		stream binary.
		aGitStorableObject compressedOn: stream ].