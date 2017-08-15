enumerating
artifactReferencesDo: aBlock
	self flag: 'TODO: skip absent artifacts, nothing to deserialize there anyway'.
	self tableOfContents keysDo: [:eachString |
		aBlock value: (directory resolve: eachString)]