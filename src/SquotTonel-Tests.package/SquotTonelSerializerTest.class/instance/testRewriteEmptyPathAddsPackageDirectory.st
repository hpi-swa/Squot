tests
testRewriteEmptyPathAddsPackageDirectory
	| path serializerClass |
	serializerClass := SquotTonelSerializer.
	path := serializerClass rewritePath: '' for:
		(SquotShadowGraph withSingleShadow:
			(PackageInfo new squotShadowFactory forPackageNamed: 'Test' withSnapshot: nil)).
	self assert: 'Test' equals: path.