verifying
verifyPackEntries
"see pack-format.txt in the 'technical' directory of the git sources.
Also, take a look at the comments in #verifyEntryOffsets, #verifyEntrySizes
and #expandAndVerify:."

	| checksum calculatedChecksum |
	self 
		verifyEntryOffsets;
		verifyEntrySizes.

	self assert: self isEntryCommit.
	self skipEntryHeader.
	packReader skip: self compressedDataSize.
	
	self assert: self isEntryCommit.	
	self skipEntryHeader.
	packReader skip: self compressedDataSize.

	self assert: self isEntryCommit.
	self skipEntryHeader.
	packReader skip: self compressedDataSize.
	
	self assert: self isEntryTree.
	self skipEntryHeader.
	packReader skip: self compressedDataSize.
	
	self assert: self isEntryBlob.
	self skipEntryHeader.
	packReader skip: self compressedDataSize.
	
	self assert: self isEntryTree.
	self skipEntryHeader.
	packReader skip: self compressedDataSize.
	
	[ self assert: self isEntryRefDelta.
	self skipEntryHeader.
	"deltified objects of type ref_delta reference their base object via SHA-1 name:"
	self skipBaseObjectReference.
	packReader skip: self compressedDataSize ]
		on: TestFailure
		do: [ self assert: self isEntryOfsDelta.
			self skipEntryHeader.
			"deltified objects of type ofs_delta reference their base object via offset:"
			self skipBaseObjectOffset.
			packReader skip: self compressedDataSize ].
	
	self assert: self isEntryTree.
	self skipEntryHeader.
	packReader skip: self compressedDataSize.
	
	[ self assert: self isEntryRefDelta.
	self skipEntryHeader.
	"deltified objects of type ref_delta reference their base object via SHA-1 name:"
	self skipBaseObjectReference.
	packReader skip: self compressedDataSize ]
		on: TestFailure
		do: [ self assert: self isEntryOfsDelta.
			self skipEntryHeader.
			"deltified objects of type ofs_delta reference their base object via offset:"
			self skipBaseObjectOffset.
			packReader skip: self compressedDataSize ].

	calculatedChecksum := self calculatePackChecksum.
	checksum := packReader next: 20.
	self 
		assert: checksum
		equals: calculatedChecksum asByteHash.
	
	self assert: packReader atEnd