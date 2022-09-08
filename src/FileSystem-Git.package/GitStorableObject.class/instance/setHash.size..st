initialize-release
setHash: aHash size: anInteger
	aHash ifNotNil: [integerHash := aHash asIntegerHash].
	loadedSize := anInteger.