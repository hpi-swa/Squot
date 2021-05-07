unit of work
finish
	super finish.
	self numberOfClients = 0 ifTrue: [gitUnitOfWork finish].