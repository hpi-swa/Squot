operations-writing-index
writeIndexFile
	self indexFile reference writeStreamDo: [ :stream | 
		stream binary.
		self
			writeIndexFileHeaderOn: stream;
			writeFanoutTableOn: stream;
			writeObjectNamesOn: stream;
			writeCRCTableOn: stream;
			writeOffsetTablesOn: stream;
			writeIndexFileTrailerOn: stream ]