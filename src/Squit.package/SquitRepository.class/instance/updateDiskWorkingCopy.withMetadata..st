Squit internal
updateDiskWorkingCopy: aSnapshot withMetadata: shouldStoreMetadataBoolean
	self hasDiskWorkingCopy ifFalse: [^ self].
	UIManager default informUser: 'Updating working copy on the disk...' during:
		[self store: aSnapshot
			in: self diskWorkingCopyDirectory
			withMetadata: shouldStoreMetadataBoolean].