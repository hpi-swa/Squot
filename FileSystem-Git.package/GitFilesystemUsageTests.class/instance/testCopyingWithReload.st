commit tests
testCopyingWithReload
	| ref originalContent copyContent |
	self createSomeCommits.
	ref := workingCopy / 'copy'.
	self deny: ref exists.
	
	(workingCopy / 'file1') copyTo: ref.
	self commit: 'a commit'.
	workingCopy := fsRepository head.
	ref := workingCopy / 'copy'.
	self assert: ref exists.
	self assert: (workingCopy / 'file1') exists.
	originalContent := (workingCopy / 'file1') readStream contents.
	copyContent := ref readStream contents.
	self assert: originalContent = copyContent.
	self assert: copyContent asString = 'content'