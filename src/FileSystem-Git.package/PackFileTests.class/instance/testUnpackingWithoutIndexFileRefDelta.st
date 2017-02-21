tests
testUnpackingWithoutIndexFileRefDelta
	| pack |
	self usePackWithRefDelta.
	indexFile delete.
	pack := GitPackFile on: packFile in: repository.
	pack unpack