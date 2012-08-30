accessing
clearRootTree
	cache workingDirectory children do: [ :reference|
		reference deleteAll].
	
	self 
		initializeWith: repository
		with: cache
		for: nil