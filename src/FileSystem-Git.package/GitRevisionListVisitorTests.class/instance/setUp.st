running
setUp
	super setUp.
	repository := GitRepository on: (FileSystem memory / 'test.git').
	emptyBlob := (GitBlob bytes: '' in: repository) store; yourself.
	simpleTree := (GitTree entries: {
			GitTreeEntry fileNamed: 'a' hash: emptyBlob hash in: repository }
		in: repository) store; yourself.
	visitor := GitRevisionListVisitor new.