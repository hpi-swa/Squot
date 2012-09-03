tests
testVersionsOrder
	| versions versionOld versionNew |
	versions := repository versions.
	versionOld := versions detect: [ :version | version message = 'message1' ].
	versionNew := versions detect: [ :version | version message = 'message2' ].
	self assert: versionNew = (versions at: 1).
	self assert: versionOld = (versions at: 2)