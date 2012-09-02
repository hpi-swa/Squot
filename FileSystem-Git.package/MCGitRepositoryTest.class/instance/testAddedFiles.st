tests
testAddedFiles
	| versionInfo root fileNameToLookup mcz|
	versionInfo := self addVersionWithSnapshot: self snapshot1 name: 'rev1'.
	root := repository repository tagNamed: versionInfo name.
	fileNameToLookup := versionInfo name, '.mcz'.
	self assert: (fileNameToLookup = 'MonticelloTest-xxx.1-rev1.mcz').
	mcz := root  / fileNameToLookup.
	self assert: mcz exists.
	self assert: mcz readStream size > 0.