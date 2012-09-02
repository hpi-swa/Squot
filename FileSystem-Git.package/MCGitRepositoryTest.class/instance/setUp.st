running
setUp
	
	filesystem :=  FileSystem memory.
	repository :=  MCGitRepository reference: filesystem root.
	
	GitStamp
		defaultName: 'Homer Simpson';
		defaultEmail: 'homer@nuke.com'