tests
testWriteStreamifPresentExists
	| ref pass path |
	pass := false.
	path := FSPath * 'plonk'.
	filesystem store createFile: path.
	ref := filesystem referenceTo: path.
	ref writeStreamIfPresent: [ pass := true ].
	self assert: pass