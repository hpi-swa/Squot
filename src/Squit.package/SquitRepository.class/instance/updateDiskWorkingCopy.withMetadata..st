Squit internal
updateDiskWorkingCopy: aSnapshot withMetadata: shouldStoreMetadataBoolean
	self hasDiskWorkingCopy ifFalse: [^ self].
	self store: aSnapshot
		in: self diskWorkingCopyDirectory
		withMetadata: shouldStoreMetadataBoolean.