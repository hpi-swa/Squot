intercepted
entryAt: aResolvable
	| realEntry |
	realEntry := wrappedFilesystem entryAt: aResolvable.
	^ self wrapEntry: realEntry