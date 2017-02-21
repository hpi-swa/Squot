instance creation
filesystem: aGitFS
	"create a new info for the current revision"
	^ self filesystem: aGitFS commit: aGitFS revision