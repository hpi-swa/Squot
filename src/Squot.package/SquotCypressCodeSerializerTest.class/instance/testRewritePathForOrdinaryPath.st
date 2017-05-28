testing
testRewritePathForOrdinaryPath
	| path serializerClass |
	serializerClass := SquotCypressCodeSerializer.
	path := serializerClass rewritePath: 'src/test' ofPackage: (PackageInfo new packageName: 'Test').
	self assert: 'src/test/Test.package' equals: path.