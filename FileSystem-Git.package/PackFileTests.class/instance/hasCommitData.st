helpers-testing
hasCommitData
"If the current entry (first byte of data) is really commit data then the first four bytes will spell 'tree'"
	| compressedSize stream position |
	position := packReader position.
	self skipEntryHeader.	
	compressedSize := self compressedDataSize.
	stream := (ZLibReadStream on: (packReader next: compressedSize)) contents readStream.
	packReader position: position.
	
	^ (stream next: 4) asString = GitTree typeCode