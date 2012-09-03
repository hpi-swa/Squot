tests
testVersions
	| versions versionOld versionNew workingCopy |
	
	self assert: repository versions size equals: 2.
	
	workingCopy := repository head.
	(workingCopy / 'aFile') writeStreamDo: [ :stream | stream nextPutAll: 'aFile' ].
	workingCopy commit: 'message3'.
	
	versions := repository versions.
	self assert: versions size equals: 3.
	
	versions detect: [ :version| version message = 'message3' ].
	versionNew := versions detect: [ :version | version message = 'message1' ].
	versionOld := versions detect: [ :version | version message = 'message2' ].
	
	self assert: versionOld root children size equals: 1.
	self assert: versionOld root children first basename equals: 'first blob'.
	
	self assert: versionNew root children size equals: 1.
	self assert: versionNew root children first basename equals: 'second blob'