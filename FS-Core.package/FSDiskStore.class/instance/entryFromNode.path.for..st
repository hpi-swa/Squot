public
entryFromNode: node path: path for: aFileystem
	| entryPath |
	entryPath := path / (self basenameFromEntry: node).
	^ self entryFromNode: node filesystem: aFileystem path: entryPath