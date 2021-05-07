private
appendToLoadOrder: path
	(loadOrder includes: path) ifFalse: [loadOrder add: path].