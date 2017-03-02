initialize-release
createFilesystem
	^ FileSystem store: (FSDiskStore activeClass createDefault)