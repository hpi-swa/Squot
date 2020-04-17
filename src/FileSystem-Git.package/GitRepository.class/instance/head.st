public-accessing-objects
head
	"Answers the GitCommit object referenced in / via 'HEAD'."
	self privateDeprecatedUseUnitOfWork.
	^ self headIfAbsent: [ 
			GitObjectNotFoundError
				signal: 'HEAD reference not found'
				with: 'HEAD' ]