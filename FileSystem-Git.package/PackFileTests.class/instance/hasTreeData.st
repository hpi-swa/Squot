helpers-testing
hasTreeData
"If the current entry (first byte of data) is really tree data then the beginning of
the data will either be GitTreeEntry class>>dirMode of GitTreeEntry class>>fileMode."
	| compressedSize stream position mode |
	position := packReader position.
	self skipEntryHeader.
	compressedSize := self compressedDataSize.
	stream := (ZLibReadStream on: (packReader next: compressedSize)) contents readStream.
	packReader position: position.
	
	mode := (stream next: 6) asString.
	^ (mode = (GitTreeEntry printMode: GitTreeEntry dirMode)) | 
		(mode = (GitTreeEntry printMode: GitTreeEntry fileMode))