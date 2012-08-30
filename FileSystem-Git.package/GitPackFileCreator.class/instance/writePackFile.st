operations-writing
writePackFile
	self packFile reference writeStreamDo: [ :stream |
		self
			writePackFileHeaderOn: stream;
			writeObjectsOn: stream ].
	self writePackFileTrailer