operations-writing
writeIndexFile
	self indexFile reference writeStreamDo: [ :stream | 
		self
			writeIndexFileHeaderOn: stream;
			writeFanoutTableOn: stream;
			writeCRCTableOn: stream
			writeOffsetTablesOn: stream ].
	self writeIndexFileTrailer