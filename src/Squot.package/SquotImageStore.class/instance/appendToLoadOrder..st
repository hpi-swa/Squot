private
appendToLoadOrder: path
	(self loadOrder includes: path) ifFalse: [self loadOrder add: path].