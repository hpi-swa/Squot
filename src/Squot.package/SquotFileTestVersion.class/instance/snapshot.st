accessing
snapshot
	| store |
	store := SquotFileSystemStore inDirectory: self directory / 'tree'.
	^ store captureLazySnapshot