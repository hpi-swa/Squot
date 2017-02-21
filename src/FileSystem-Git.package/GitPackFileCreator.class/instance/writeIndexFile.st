operations-writing-index
writeIndexFile
	self indexFile reference writeStreamDo: [ :stream | 
		self
			writeIndexFileHeaderOn: stream;
			writeFanoutTableOn: stream;
			writeObjectNamesOn: stream;
			writeCRCTableOn: stream;
			writeOffsetTablesOn: stream;
			writeIndexFileTrailerOn: stream ]