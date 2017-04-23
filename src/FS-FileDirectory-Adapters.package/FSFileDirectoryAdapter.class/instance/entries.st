enumeration
entries
	^ reference entries collect: [:each | FSFileDirectoryEntryAdapter onEntry: each]