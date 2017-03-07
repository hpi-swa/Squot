tests
testLineEndingsAreNormalized
	| fileCRBlob fileCRLFBlob fileLFBlob |
	workingCopy / 'fileCR' writeStreamDo: [:stream | stream nextPut: $a; cr; nextPut: $b].
	workingCopy / 'fileLF' writeStreamDo: [:stream | stream nextPut: $a; lf; nextPut: $b].
	workingCopy / 'fileCRLF' writeStreamDo: [:stream | stream nextPut: $a; crlf; nextPut: $b].
	workingCopy commit: 'add text files'.
	fileCRBlob := basicRepository objectNamed: (basicRepository head tree entryAt: 'fileCR') entryHash.
	fileLFBlob := basicRepository objectNamed: (basicRepository head tree entryAt: 'fileLF') entryHash.
	fileCRLFBlob := basicRepository objectNamed: (basicRepository head tree entryAt: 'fileCRLF') entryHash.
	self assert: #[97 10 98] equals: fileCRBlob bytes description: 'cr normalized'.
	self assert: #[97 10 98] equals: fileLFBlob bytes description: 'lf normalized'.
	self assert: #[97 10 98] equals: fileCRLFBlob bytes description: 'crlf normalized'.
