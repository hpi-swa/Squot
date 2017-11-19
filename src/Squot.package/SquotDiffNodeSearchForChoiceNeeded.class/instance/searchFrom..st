visiting
searchFrom: aDiffNode
	self enqueueAll: (Array with: aDiffNode).
	[nodeThatNeedsChoice notNil and: [upcomingNodes notEmpty]] whileTrue:
		[self visit: upcomingNodes removeFirst].