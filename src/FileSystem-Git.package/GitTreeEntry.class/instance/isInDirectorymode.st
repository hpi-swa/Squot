public-testing
isInDirectorymode
	^ isInFilemode not and: [self isSubmodule not]