tests
testRewritePathForEmptyPath
	| path serializerClass |
	serializerClass := SquotCypressCodeSerializer.
	path := serializerClass rewritePath: '' ofPackage: (PackageInfo new packageName: 'Test').
	self assert: 'Test.package' equals: path.