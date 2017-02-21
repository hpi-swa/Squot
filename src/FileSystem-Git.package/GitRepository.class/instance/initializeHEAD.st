initialize-release
initializeHEAD
	self baseDir / 'HEAD'
		writeStreamDo: [ :stream | 
			stream
				nextPutAll: 'ref: refs/heads/master';
				lf ]