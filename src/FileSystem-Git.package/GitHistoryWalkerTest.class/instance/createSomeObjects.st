helpers
createSomeObjects
	emptyBlob := (GitBlob bytes: '' in: repository) store; yourself.
	simpleTree := (GitTree entries: {
			GitTreeEntry fileNamed: 'a' hash: emptyBlob hash in: repository }
		in: repository) store; yourself.