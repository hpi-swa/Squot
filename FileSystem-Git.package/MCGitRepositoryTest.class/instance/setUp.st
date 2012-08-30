running
setUp
	
	filesystem :=  FSFilesystem memory.
	repository :=  MCGitRepository reference: filesystem root.
	
	GitStamp
		defaultName: 'Homer Simpson';
		defaultEmail: 'homer@nuke.com'