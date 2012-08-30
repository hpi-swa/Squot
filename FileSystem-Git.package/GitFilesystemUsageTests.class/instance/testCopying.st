commit tests
testCopying
	| ref originalContent copyContent |
	self createSomeCommits.
	ref := workingCopy / 'copy'.
	self deny: ref exists.
	
	(workingCopy / 'file1') copyTo: ref.
	self commit: 'a commit'.
	self assert: ref exists.
	self assert: (workingCopy / 'file1') exists.
	self assert: (workingCopy / 'copy') exists.
	originalContent := (workingCopy / 'file1') readStream contents.
	copyContent := ref readStream contents.
	self assert: originalContent = copyContent.
	self assert: copyContent asString = 'content'.
	