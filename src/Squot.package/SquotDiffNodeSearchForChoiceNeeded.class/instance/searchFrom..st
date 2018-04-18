visiting
searchFrom: aDiffNode
	self enqueueAll: (Array with: aDiffNode).
	[nodeThatNeedsChoice isNil and: [upcomingNodes notEmpty]] whileTrue:
		[self visit: upcomingNodes removeFirst].