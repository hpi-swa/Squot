initialize-release
initializeWith: aPackFile
	self 
		packFile: aPackFile;
		repository: aPackFile repository.
	aPackFile reference: aPackFile repository packsDir / 'tmp_pack_XXXXXX'