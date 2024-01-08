building
addVersion: aVersion at: aPath
	| stream mczPath |
	(self addedPackages includes: aVersion package) ifTrue: [^ self].
	stream := RWBinaryOrTextStream on: (String new: 10000).
	aVersion fileOutOn: stream.
	mczPath := (SquotPathUtilities asString: aPath), '.mcz'.
	(self zip addString: stream contents as: mczPath)
		desiredCompressionLevel: 0. "mcz is already compressed"
	self addPreambleLine: ('self fileInMonticelloZipVersionNamed: {1}.'
								format: {mczPath printString}).
	self addedPackages add: aVersion package.