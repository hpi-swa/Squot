tests
testVersions
	| versions version1 version2 workingCopy |
	
	self assert: repository versions size equals: 2.
	
	workingCopy := repository head.
	(workingCopy / 'aFile') writeStreamDo: [ :stream | stream nextPutAll: 'aFile' ].
	workingCopy commit: 'message3'.
	
	versions := repository versions.
	self assert: versions size equals: 3.
	
	versions detect: [ :version| version message = 'message3' ].
	version1 := versions detect: [ :version | version message = 'message1' ].
	version2 := versions detect: [ :version | version message = 'message2' ].
	
	self assert: version1 root children size equals: 1.
	self assert: version1 root children first basename equals: 'blob1'.
	
	self assert: version2 root children size equals: 1.
	self assert: version2 root children first basename equals: 'blob2'