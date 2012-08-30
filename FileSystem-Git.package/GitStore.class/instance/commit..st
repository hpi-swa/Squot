git-delegating
commit: aMessage
	"Creates a commit with message ==aMessage== in the currently active branch."
	self basicCommit: aMessage to: self branchName