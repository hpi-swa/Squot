initialize-release
createFilesystem
	^ FSFilesystem store: (FSDiskStore activeClass createDefault)