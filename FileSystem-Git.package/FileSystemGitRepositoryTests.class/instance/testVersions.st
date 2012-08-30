tests
testVersions
	| versions versionOld versionNew workingCopy |
	workingCopy := repository head.
	(workingCopy / 'aFile') writeStreamDo: [ :stream | stream nextPutAll: 'third commit' ].
	workingCopy commit: 'commit 3'.
	
	versions := repository versions.
	self assert: versions size = 3.
	versions detect: [ :version| version message = 'commit 3' ].
	versionNew := versions detect: [ :version | version message = 'second commit' ].
	versionOld := versions detect: [ :version | version message = 'first commit' ].
	
	self assert: versionOld root children size = 1.
	self assert: versionOld root children first basename = 'first blob'.
	
	self assert: versionNew root children size = 1.
	self assert: versionNew root children first basename = 'second blob'