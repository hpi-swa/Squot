enumerating
artifactReferencesDo: aBlock
	self tableOfContents keysDo: [:eachString |
		aBlock value: (directory resolve: eachString)]