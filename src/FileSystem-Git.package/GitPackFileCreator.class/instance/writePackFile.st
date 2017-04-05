operations-writing-pack
writePackFile
	self packFile reference ensureDeleted.
	self packFile reference writeStreamDo: [:stream |
		stream binary.
		self
			writePackFileHeaderOn: stream;
			writeObjectsOn: stream;
			writePackFileTrailerOn: stream]