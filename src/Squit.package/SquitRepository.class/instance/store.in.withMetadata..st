Squit internal
store: aSnapshot in: aDirectoryReference withMetadata: shouldStoreMetadata
	| fsStore |
	fsStore := SquotFileSystemStore inDirectory: aDirectoryReference.
	shouldStoreMetadata ifFalse: [fsStore doNotStoreMetadata].
	fsStore restoreToSnapshot: aSnapshot.