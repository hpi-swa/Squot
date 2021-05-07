accessing
unitOfWork
	"Answer the currently active unit of work or create a new one."
	^ self withUnitOfWork:
		[SquitUnitOfWork
		wrapping: gitRepository repository currentUnitOfWork
		for: self]