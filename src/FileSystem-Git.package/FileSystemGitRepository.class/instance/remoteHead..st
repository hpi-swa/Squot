git porcelain
remoteHead: remoteRefs
	^ (((remoteRefs at: #capabilities ifAbsent: [^ nil])
		detect: [:each | each beginsWith: 'symref=HEAD:']
		ifNone: [^ nil])
		splitBy: ':') second
		ifEmpty: [^ nil]