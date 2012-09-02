tests
testEmptyCommitTimeStamp
	"uncommitted working copy will not have a stamp"
	| commitStamp authorStamp repo fs |
	repo := FSFilesystem memory / 'repo.git'.
	fs := (FileSystemGitRepository on: repo) head.
	
	commitStamp := fs timeStampOfCommit.
	authorStamp := fs timeStampOfCreation.
	self assert: commitStamp isNil.
	self assert: authorStamp isNil.