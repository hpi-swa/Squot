modification
updateFromReference: aFSReference
	| directoryEntry |
	directoryEntry := aFSReference entry.
	ctime := directoryEntry creation.
	mtime := directoryEntry modification.
	size := directoryEntry size.
	objectHash := (GitBlob bytes: (aFSReference readStreamDo: [:stream | stream binary contents]) in: nil) hexHash asByteHash.