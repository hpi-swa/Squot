accessing-references
refFromFile: aFileReference relativeTo: baseDirectory
	self privateDeprecatedUseUnitOfWork.
	^ (aFileReference asAbsolute relativeTo: baseDirectory asAbsolute) printWithDelimiter: $/