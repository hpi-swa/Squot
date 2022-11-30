delegate
openFileStream: path writable: aBoolean
	self deprecated.
	^ cacheStore openFileStream: path writable: aBoolean