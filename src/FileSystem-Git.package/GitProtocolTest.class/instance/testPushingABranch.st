tests
testPushingABranch
	"prepare a new repository with a new random branch"
	<timeout: 10 "seconds">
	| randomName repo workingCopy protocol fullRefName |
	repo := FileSystemGitRepository on: FileSystem memory root.
	workingCopy := repo head.
	workingCopy / 'aFile' writeStreamDo: [:stream | stream nextPutAll: 'new file'].
	randomName := String streamContents: [:str |
		32 timesRepeat: [str nextPut: '0123456789abcdef' atRandom]].
	temporaryGitStamp := TemporaryGitStamp ensureDefaultValues.
	workingCopy branch: randomName message: 'testPushingBranch commit'.
	fullRefName := 'refs/heads/', randomName.
	"push that branch to the test repository"
	protocol := self newProtocol.
	protocol pushReferences: {fullRefName -> workingCopy revision} of: repo repository deleting: Array empty.
	"assert a positive response"
	"initiate a fetch of the new branch"
	protocol loadRefs.
	"assert that the branch exists and the object id is the same"
	self assert: (protocol refs includesKey: fullRefName).
	"remove the branch (tearDown)"
	protocol pushReferences: Array empty of: repo repository deleting:  {fullRefName}.
	protocol loadRefs.
	self deny: (protocol refs includesKey: fullRefName).