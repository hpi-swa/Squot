visiting
visitCommit: aCommit
	(self isReachable: aCommit) ifTrue: [ ^ self ].
	
	self
		mark: aCommit;
		validate: aCommit;
		visit: aCommit tree