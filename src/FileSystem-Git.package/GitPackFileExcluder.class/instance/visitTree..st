visiting
visitTree: aTree
	self exclude: aTree andIfNotAlreadyExcluded:
		[queue addAll: aTree objects].