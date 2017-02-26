tests
testDoesntContainReferenceFilesystem
	| ref other |
	ref := filesystem  * 'griffle'.
	other := FSFilesystem memory / 'griffle' / 'nurp'.
	self deny: (ref contains: other)