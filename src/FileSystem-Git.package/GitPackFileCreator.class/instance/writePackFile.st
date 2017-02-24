operations-writing-pack
writePackFile
	self packFile reference writeStreamDo: [ :stream |
		stream binary.
		self
			writePackFileHeaderOn: stream;
			writeObjectsOn: stream;
			writePackFileTrailerOn: stream ]