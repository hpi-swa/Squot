as yet unclassified
setUp
	| reference |
	reference := (FileSystem memory / 'test.git').
	repository := GitRepository on: reference.