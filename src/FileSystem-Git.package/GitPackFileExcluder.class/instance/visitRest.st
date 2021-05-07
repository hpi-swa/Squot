visiting
visitRest
	[queue notEmpty] whileTrue:
		[self visit: queue removeFirst].