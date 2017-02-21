as yet unclassified
setUp
	| reference |
	super setUp.
	reference := (FileSystem memory / 'test.git').
	repository := GitRepository on: reference.