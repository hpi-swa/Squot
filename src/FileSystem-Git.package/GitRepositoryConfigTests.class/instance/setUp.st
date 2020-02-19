running
setUp
	| reference |
	super setUp.
	reference := (FileSystem memory / 'test.git').
	repository := GitRepository on: reference.
	(configFile := repository baseDir / 'config') ensureDeleted.
	