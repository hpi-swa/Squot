tests
testRewritePathAddsPackageDirectory
	| path serializerClass |
	serializerClass := SquotTonelSerializer.
	path := serializerClass rewritePath: 'src/tests' for:
		(PackageInfo new squotShadowFactory forPackageNamed: 'Test' withSnapshot: nil).
	self assert: 'src/tests/Test' equals: path.