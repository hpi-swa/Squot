initialize-release
readStream
	^ readStream ifNil: [ self packData readStream ]