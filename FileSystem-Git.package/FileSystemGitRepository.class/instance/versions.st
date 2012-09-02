accessing
versions
	| commits |
	commits := OrderedCollection new.
	self 
		recursivelyCollectCommits: repository head
		into: commits
		limit: nil.
	
	^ commits collect: [ :each |
		self filesystemOn: each ] 