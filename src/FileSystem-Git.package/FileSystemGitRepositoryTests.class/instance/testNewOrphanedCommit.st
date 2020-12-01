tests
testNewOrphanedCommit
	"When starting from no revision, the GitFilesystem should be empty.
	There was an error that a new orphaned commit would contain files from HEAD."
	| git headCommit workingCopy masterCommit newCommit |
	"given"
	git := self unitOfWork.
	headCommit := git objectNamed: git headRef.
	self assert: headCommit notNil;
		assert: repository head root entries notEmpty.
	masterCommit := git branchNamed: 'master'.
	self assert: masterCommit notNil.
	"when"
	workingCopy := repository branchNamed: 'new'.
	"then"
	self assert: workingCopy root entries isEmpty.
	(workingCopy / 'file') ensureFile.
	workingCopy branch: 'new' message: 'new orphan commit'.
	newCommit := git branchNamed: 'new'.
	self assert: newCommit parents isEmpty;
		assert: masterCommit equals: (git branchNamed: 'master')
			description: 'master should not be modified by the new branch';
		assert: ((repository branchNamed: 'new') root entries collect: #asFileReference) = (workingCopy root entries collect: #asFileReference).