Pur historian
version
	^ repository versionForCommit:
		(self git objectReferenced: referenceName)