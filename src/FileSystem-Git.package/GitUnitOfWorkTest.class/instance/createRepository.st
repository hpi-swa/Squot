running
createRepository
	reference := (FileSystem memory / 'test.git').
	repository := basicRepository := GitRepository on: reference.