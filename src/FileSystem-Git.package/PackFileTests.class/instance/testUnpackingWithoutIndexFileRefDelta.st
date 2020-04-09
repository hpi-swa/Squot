tests
testUnpackingWithoutIndexFileRefDelta
	| pack |
	self usePackWithRefDelta.
	repository withUnitOfWork:
	[indexFile delete.
	pack := GitPackFile on: packFile in: repository.
	pack unpack]