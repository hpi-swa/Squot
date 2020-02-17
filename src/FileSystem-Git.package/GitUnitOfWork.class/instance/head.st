accessing
head
	"Answers the GitCommit object referenced in / via 'HEAD'."
	^ self headIfAbsent: [ 
			GitObjectNotFoundError
				signal: 'HEAD reference not found'
				with: 'HEAD' ]