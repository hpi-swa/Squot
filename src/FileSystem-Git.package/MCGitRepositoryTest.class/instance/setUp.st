running
setUp
	
	filesystem :=  FileSystem memory.
	repository :=  MCGitRepository reference: filesystem root.
	temporaryGitStamp := TemporaryGitStamp ensureDefaultValues.
