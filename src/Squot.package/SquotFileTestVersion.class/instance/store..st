accessing
store: aSnapshot
	| store |
	store := SquotFileSystemStore inDirectory: (self directory / 'tree') ensureDirectory.
	store restoreToSnapshot: aSnapshot.