tests
testVersionsOrder
	| versions versionOld versionNew |
	versions := repository versions.
	versionOld := versions detect: [ :version | version message = 'first commit' ].
	versionNew := versions detect: [ :version | version message = 'second commit' ].
	self assert: versionNew = (versions at: 1).
	self assert: versionOld = (versions at: 2)