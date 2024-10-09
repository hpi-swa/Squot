updating
everythingChanged
	self
		changed: #activeWorkingCopy;
		changed: #refTreeRoots;
		changed: #commitList;
		activeRefTreeMember: nil;
		activeCommit: (self activeWorkingCopy ifNotNil: #headCommit).