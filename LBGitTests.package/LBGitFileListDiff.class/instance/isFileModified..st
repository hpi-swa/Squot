diff creation
isFileModified: aPath

	^ (self left trackedFiles at: aPath) entryHash
	~= (self right trackedFiles at: aPath) entryHash