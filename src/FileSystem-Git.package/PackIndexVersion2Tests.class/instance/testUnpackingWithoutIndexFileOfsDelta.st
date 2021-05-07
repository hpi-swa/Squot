tests
testUnpackingWithoutIndexFileOfsDelta
	| pack |
	self usePackWithOfsDelta.
	repository withUnitOfWork:
	[indexFile delete.
	pack := GitPackFile on: packFile in: repository.
	pack unpack].