tests-references
testReadStream
	| reference stream |
	self delete: (reference := filesystem workingDirectory / 'griffle').
	self
		should: [ reference readStream ]
		raise: FSFileDoesNotExist.
	reference writeStreamDo: [ :ws | ws nextPutAll: 'griffle' ].
	self
		shouldnt: [ stream := reference readStream ]
		raise: FSFileDoesNotExist.
	self assert: stream contents asString = 'griffle'.
	stream close