instance creation
fromLooseObjectStream: aStream in: aGitRepository
	^ self new
		typeCode: (aStream upTo: Character space asInteger) asString;
		objectSize: (aStream upTo: 0) asString asInteger;
		yourself