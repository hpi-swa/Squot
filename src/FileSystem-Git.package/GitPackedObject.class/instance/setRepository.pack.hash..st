initialize-release
setRepository: aRepository pack: aPackFile hash: aHash
	self repository: aRepository;
		pack: aPackFile.
	hexHash := aHash asHexHash.