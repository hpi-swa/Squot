accessing
remote
	self accepted ifFalse: [^ nil].
	self remoteName isEmptyOrNil ifTrue: [^ nil].
	self remoteUrl isEmptyOrNil ifTrue: [^ nil].
	^ (GitRemote name: self remoteName url: self remoteUrl)
		addDefaultFetchSpec;
		yourself