public-operations
unpack
	self packedObjectsDo: [ :packedObject |
		packedObject object store ]