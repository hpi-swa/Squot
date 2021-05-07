tests
testCopyingExistingFile
	| ref originalContent copyContent |
	self createSomeCommits.
	ref := workingCopy / 'copy'.
	self deny: ref exists.
	
	self withUnitOfWork: [:git |
	(workingCopy / 'file1') copyTo: ref.
	self assert: ref exists.
	self assert: (workingCopy / 'copy') exists.
	originalContent := (workingCopy / 'file1') readStream contents.
	copyContent := ref readStream contents.
	self assert: originalContent = copyContent.
	self assert: copyContent asString = 'content'
	].