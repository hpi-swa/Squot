delegate
basicCopy: source ifAbsent: aBlock to: destination ifPresent: pBlock  filesystem: aFilesystem
	self ensure: source.
	self ensure: destination.
	cacheStore basicCopy: source ifAbsent: aBlock to: destination ifPresent: pBlock  filesystem: aFilesystem.
	modManager markFileCreated: destination.