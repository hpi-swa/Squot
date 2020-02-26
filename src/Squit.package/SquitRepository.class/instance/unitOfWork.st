accessing
unitOfWork
	"Answer the currently active unit of work or create a new one."
	^ SquitUnitOfWork
		wrapping: (GitCurrentUnitOfWork for: gitRepository repository)
		for: self