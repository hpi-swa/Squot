private to be removed
versions
	| commits |
	commits := OrderedCollection new.
	self 
		recursivelyCollectCommits: self unitOfWork head
		into: commits
		limit: nil.
	self flag: #GitTodo. "this is not a good idea for large histories"
	
	^ commits collect: [ :each |
		self filesystemOn: each ] 