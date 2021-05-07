private
undo
	self withActiveUnitOfWork:
		[repository fsgitRepository
			removeRemoteNamed: query remoteName].
	self notifyRollback.