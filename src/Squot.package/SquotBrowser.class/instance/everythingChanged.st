updating
everythingChanged
	self
		changed: #activeWorkingCopy;
		changed: #refList;
		changed: #commitList;
		activeRef: nil;
		activeCommit: (self activeWorkingCopy ifNotNil: #headCommit).