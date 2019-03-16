accessing
storeTreeAndApply: aSquotPatch
	| store |
	self parents ifNotEmpty: [:parents | parents first copyTreeTo: self directory / 'tree'].
	store := SquotFileSystemStore inDirectory: (self directory / 'tree') ensureDirectory.
	store applyPatch: aSquotPatch.