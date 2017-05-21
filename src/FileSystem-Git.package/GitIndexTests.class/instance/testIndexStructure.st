tests
testIndexStructure
	index openForReadingDo: [:index |
		self 
			verifyIndexHeader;
			verifyIndexEntries;
			verifyIndexExtensions].