instance creation
on: aGitRepository
	^ self new
		baseDir: aGitRepository baseDir;
		packedRefsFile: (self packedRefsFileIn: aGitRepository);
		yourself