enumerating
artifactReferencesDo: aBlock
	"Enumerates all file system references to artifacts in loading order."
	self tableOfContents keysDo: [:eachString |
		aBlock value: (directory resolve: eachString)]