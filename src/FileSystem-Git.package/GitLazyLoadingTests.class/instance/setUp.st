running
setUp
	super setUp.
	filesystem := FileSystem memory.
	repository := FileSystemGitRepository on: filesystem root.
	workingCopy := repository head.
	
	workingCopy / 'file1' writeStreamDo: [ :stream | stream nextPutAll: 'file1' ].
	workingCopy / 'file2' writeStreamDo: [ :stream | stream nextPutAll: 'file2' ].
	workingCopy / 'file3' writeStreamDo: [ :stream | stream nextPutAll: 'file3' ].
	self commit: 'added 3 files to root'.

	(workingCopy / 'dir1') createDirectory.
	(workingCopy / 'dir1' / 'file1') writeStreamDo: [ :stream | stream nextPutAll: 'file1 in dir1' ].
	(workingCopy / 'dir1' / 'file2') writeStreamDo: [ :stream | stream nextPutAll: 'file2 in dir1' ].
	(workingCopy / 'dir1' / 'file3') writeStreamDo: [ :stream | stream nextPutAll: 'file3 in dir1' ].
	self commit: 'added a directory with 3 files to root'.
	
	(workingCopy / 'dir2') createDirectory.
	(workingCopy / 'dir2' / 'file1') writeStreamDo: [ :stream | stream nextPutAll: 'file1 in dir2' ].
	(workingCopy / 'dir2' / 'file2') writeStreamDo: [ :stream | stream nextPutAll: 'file2 in dir2' ].
	(workingCopy / 'dir2' / 'file3') writeStreamDo: [ :stream | stream nextPutAll: 'file3 in dir2' ].
	self commit: 'added 3 files to dir2'.
	
	repository withUnitOfWork: [
	(workingCopy / 'dir2' / 'dir2.1') createDirectory.
	(workingCopy / 'dir2' / 'dir2.1' / 'file1') writeStreamDo: [ :stream | stream nextPutAll: 'file1 in dir2.1' ].
	(workingCopy / 'dir2' / 'dir2.1' / 'file2') writeStreamDo: [ :stream | stream nextPutAll: 'file2 in dir2.1' ].
	(workingCopy / 'dir2' / 'dir2.1' / 'file3') writeStreamDo: [ :stream | stream nextPutAll: 'file3 in dir2.1' ].
	self commit: 'added a subdir to dir2 and 3 files to the subdir'
	].