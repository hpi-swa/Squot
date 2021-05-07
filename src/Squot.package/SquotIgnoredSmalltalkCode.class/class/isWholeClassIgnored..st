testing
isWholeClassIgnored: aSymbol
	^ (self changeSet classChangeAt: (self symbolInChangeSet: aSymbol)) includes: #remove