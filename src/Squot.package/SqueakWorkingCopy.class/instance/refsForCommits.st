accessing
refsForCommits
	^ refsForCommits ifNil: [self refsForCommits: self computeRefsForCommits].