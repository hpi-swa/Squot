initialize-release
readStream
	^ readStream ifNil: [ reference readStream binary ]