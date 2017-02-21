commit tests
testAddingSingleDirectoryFails
	| ref dirname sha1name |
	dirname := 'aDir'.
	sha1name := workingCopy name.
	ref := workingCopy / dirname.
	ref createDirectory.
	self assert: ref exists.
	
	workingCopy commit: 'aCommit'.
	"the commit shouldn't have happened:"
	self assert: sha1name = workingCopy name
