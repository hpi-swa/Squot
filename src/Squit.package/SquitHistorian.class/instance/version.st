Pur historian
version
	^ repository versionForCommit:
		(self gitRepository objectReferenced: referenceName)