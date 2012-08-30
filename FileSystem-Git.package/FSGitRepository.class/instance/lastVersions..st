accessing
lastVersions: anInteger 
	| commits |
	commits := OrderedCollection new.
	self 
		recursivelyCollectCommits: repository head
		into: commits
		limit: anInteger.
	
	^ commits collect: [ :each |
		self filesystemOn: each ] 