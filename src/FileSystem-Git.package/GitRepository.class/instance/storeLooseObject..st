storing
storeLooseObject: aGitStorableObject
	| objectReference |
	self privateDeprecatedUseUnitOfWork.
	objectReference := (self referenceTo: aGitStorableObject).
	objectReference exists ifTrue: [ ^ self ]. "prevent overwrites"
	
	objectReference writeStreamDo: [ :stream | 
		stream binary.
		aGitStorableObject compressedOn: stream ].
	aGitStorableObject ifNotPacked:
		[self assert:
			(objectCache at: aGitStorableObject hexHash ifAbsentPut: aGitStorableObject)
			= aGitStorableObject].