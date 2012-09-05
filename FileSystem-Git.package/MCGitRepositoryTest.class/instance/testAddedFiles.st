tests
testAddedFiles
	| versionInfo root |
	versionInfo := self addVersionWithSnapshot: self snapshot1 name: 'rev1'.
	root := repository repository tagNamed: versionInfo name.
	
	self assert: versionInfo name equals: 'MonticelloTest-xxx.1-rev1'.
	
	self assert: (root / 'y') exists.