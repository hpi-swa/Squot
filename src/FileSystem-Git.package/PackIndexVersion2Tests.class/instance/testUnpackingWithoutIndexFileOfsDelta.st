tests
testUnpackingWithoutIndexFileOfsDelta
	| pack |
	self usePackWithOfsDelta.
	indexFile delete.
	pack := GitPackFile on: packFile in: repository.
	pack unpack