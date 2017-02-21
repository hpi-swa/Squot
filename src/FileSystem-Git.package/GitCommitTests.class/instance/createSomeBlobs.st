helpers
createSomeBlobs
	^ #(file1 file2 file3) collect: [ :aString |
		(GitBlob bytes: aString in: repository) store; yourself ]