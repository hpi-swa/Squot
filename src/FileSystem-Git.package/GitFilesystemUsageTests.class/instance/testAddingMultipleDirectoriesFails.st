commit tests
testAddingMultipleDirectoriesFails
	| dir1 subDir1 dir2 sha1name |
	dir1 := 'aDir'.
	subDir1 := dir1 , '/sub'.
	dir2 := 'dir 2'.
	sha1name := workingCopy name.
	(workingCopy / dir1) createDirectory.
	self assert: (workingCopy / dir1) exists.
	(workingCopy referenceTo: subDir1) createDirectory.
	self assert: (workingCopy referenceTo: subDir1) exists.
	(workingCopy / dir2) createDirectory.
	self assert: (workingCopy / dir2) exists.
		
	
	self withUnitOfWork: [:git | workingCopy commit: 'aCommit..'].
	"the commit should not have happened:"
	self assert: sha1name = workingCopy name.