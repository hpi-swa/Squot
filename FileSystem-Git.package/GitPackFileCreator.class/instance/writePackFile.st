operations-writing-pack
writePackFile
	self packFile reference writeStreamDo: [ :stream |
		self
			writePackFileHeaderOn: stream;
			writeObjectsOn: stream;
			writePackFileTrailerOn: stream ]