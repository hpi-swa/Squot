tests
testRewriteEmptyPathAddsPackageDirectory
	| path serializerClass |
	serializerClass := SquotTonelSerializer.
	path := serializerClass rewritePath: '' for:
		(PackageInfo new squotShadowFactory forPackageNamed: 'Test' withSnapshot: nil).
	self assert: 'Test' equals: path.