operations-writing-index
writeOffsetTablesOn: aStream
	self sortedHashes size >  16r80000000
		ifFalse: [ self writeOffsetTableOfSize: 4 on: aStream ]
		ifTrue: [
			self 
				write4ByteIndexTableOn: aStream;
				writeOffsetTableOfSize: 8 on: aStream ]