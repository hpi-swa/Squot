operations
unpackWithIndexFile
	self packFile packedObjectsDo: [ :packedObject |
		packedObject object store ]