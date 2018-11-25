diff creation
isFileModified: aPath

	^ (self left trackedFiles at: aPath) hasChangesTo: (self right trackedFiles at: aPath) 