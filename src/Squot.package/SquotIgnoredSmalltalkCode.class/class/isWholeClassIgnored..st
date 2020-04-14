testing
isWholeClassIgnored: aSymbol
	^ (self changeSet classChangeAt: aSymbol) includes: #remove