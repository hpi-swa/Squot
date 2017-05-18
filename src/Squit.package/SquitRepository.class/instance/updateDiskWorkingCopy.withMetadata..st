Squit internal
updateDiskWorkingCopy: aSnapshot withMetadata: shouldStoreMetadataBoolean
	| directory fsWrapper wrappedDirectoryReference |
	self hasDiskWorkingCopy ifFalse: [^ self].
	UIManager default informUser: 'Updating working copy on the disk...' during:
		[directory := self diskWorkingCopyDirectory.
		fsWrapper := SquitFileSystemWrapper on: directory filesystem.
		wrappedDirectoryReference := FSReference filesystem: fsWrapper path: directory path.
		self store: aSnapshot
			in: wrappedDirectoryReference
			withMetadata: shouldStoreMetadataBoolean.
		self updateIndexFor: fsWrapper changedPaths].