public-accessing-objects
headOrEmptyRootCommit
	"Answers the GitCommit object referenced in / via 'HEAD' or if the repos is fresh an empty head commit"
	^ self headIfAbsent: [ 
			self emptyRootCommit ]