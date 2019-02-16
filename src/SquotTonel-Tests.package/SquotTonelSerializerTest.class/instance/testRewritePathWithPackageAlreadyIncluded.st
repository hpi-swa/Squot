tests
testRewritePathWithPackageAlreadyIncluded
	| path serializerClass |
	serializerClass := SquotTonelSerializer.
	path := serializerClass rewritePath: 'src/test/Test' for: 
		(PackageInfo new squotShadowFactory forPackageNamed: 'Test' withSnapshot: nil).
	self assert: 'src/test/Test' equals: path.