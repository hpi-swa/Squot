accessing
snapshot
	| store |
	store := SquotFileSystemStore inDirectory: self directory / 'tree'.
	^ SquotToggles useNewApi
		ifTrue: [SquotProjectSnapshot fromStore: store]
		ifFalse: [store captureLazySnapshot]