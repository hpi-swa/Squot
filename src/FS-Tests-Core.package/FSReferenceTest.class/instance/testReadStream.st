tests
testReadStream
	| ref stream path |
	path := FSPath * 'plonk'.
	filesystem store createFile: path.
	ref := filesystem referenceTo: path.
	[stream := ref readStream.
	self assert: stream class = FSReadStream ] 
		ensure: [ stream ifNotNil: [ stream close ] ]