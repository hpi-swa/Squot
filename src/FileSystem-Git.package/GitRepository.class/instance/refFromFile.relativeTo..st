accessing-references
refFromFile: aFileReference relativeTo: baseDirectory
	^ (aFileReference asAbsolute relativeTo: baseDirectory asAbsolute) printWithDelimiter: $/