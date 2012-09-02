tests-index
testwriteIndexFileTrailerOn
	| bytes index |
	index := GitIndexFileVersion2 new
		reference: (FSFilesystem memory root  / 'index');
		yourself.
	creator 
		indexFile: index;
		packFileChecksum: (GitHash from: 'bar') byteHash.
	index reference writeStreamDo: [ :stream | 
		stream nextPutAll: 'foo'.
		creator writeIndexFileTrailerOn: stream ].
	bytes := index reference readStream contents.
	
	self assert: 3 + (2 * 20) equals: bytes size