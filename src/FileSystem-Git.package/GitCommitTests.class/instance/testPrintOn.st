tests
testPrintOn
	| message commit |
	message := 'printOn test'.
	commit := GitCommit new.
	commit message: message.
	
	self assert: (commit printString includesSubstring: message).