public-operations
repackWithoutDelification
	self 
		visitRepository: self packFile repository;
		writePackFile;
		writeIndexFile;
		writeFileNames
	