enumerating
artifactReferencesDo: aBlock
	"Enumerates all file system references to artifacts in loading order."
	self flag: 'TODO: skip absent artifacts, nothing to deserialize there anyway'.
	self tableOfContents keysDo: [:eachString |
		aBlock value: (directory resolve: eachString)]