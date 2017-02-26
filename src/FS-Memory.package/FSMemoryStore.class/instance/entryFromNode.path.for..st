public
entryFromNode: association path: path for: aFilesystem
	| entryPath |
	entryPath := path / (self basenameFromEntry: association).
	^ self entryFromNode: association value filesystem: aFilesystem path: entryPath