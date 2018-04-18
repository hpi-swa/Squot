visiting
searchFrom: aDiffNode
	self enqueueAll: (Array with: aDiffNode).
	[upcomingNodes notEmpty] whileTrue:
		[self visit: upcomingNodes removeFirst].