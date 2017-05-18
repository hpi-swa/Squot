intercepted
entriesAt: aResolvable
	| realEntries |
	realEntries := wrappedFilesystem entriesAt: aResolvable.
	^ realEntries collect: [:each | self wrapEntry: each]