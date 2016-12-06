tests
testPushingABranch
	"prepare a new repository with a new random branch"
	| randomName repo workingCopy protocol fullRefName |
	repo := FileSystemGitRepository on: FileSystem memory root.
	workingCopy := repo head.
	workingCopy / 'aFile' writeStreamDo: [:stream | stream nextPutAll: 'new file'].
	randomName := String streamContents: [:str |
		32 timesRepeat: [str nextPut: '0123456789abcdef' atRandom]].
	workingCopy branch: randomName message: 'testPushingBranch commit'.
	fullRefName := 'refs/heads/', randomName.
	"push that branch to the test repository"
	protocol := self newProtocol.
	protocol putRefs: ({fullRefName -> workingCopy revision hexHash} as: Dictionary).
	"assert a positive response"
	"initiate a fetch of the new branch"
	"assert that the branch exists and the object id is the same"
	"remove the branch (tearDown)"