importing
importSquotContentsFromHeadCommit
	| commit newCommit |
	commit := self headCommit ifNil: [^ nil].
	newCommit := (self importSquotContentsFromCommit: commit) ifNil: [^ nil].
	self updateHeadRefToNewCommit: newCommit.
	^ newCommit