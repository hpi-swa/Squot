initialize-release
initializeWith: aPackFile
	| dir |
	self 
		packFile: aPackFile;
		indexFile: GitIndexFileVersion2 new;
		repository: aPackFile repository unitOfWork.
	dir := aPackFile repository packsDir. self flag: #todo. "should not depend on packsDir"
	aPackFile reference:  dir / 'tmp_pack_XXXXXX'.
	self indexFile reference: dir / 'tmp_idx_XXXXXX'