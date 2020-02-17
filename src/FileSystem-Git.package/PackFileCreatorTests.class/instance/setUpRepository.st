running
setUpRepository
	repository := GitRepository on: (FileSystem memory root / 'repo').
	1 to: 7 do: [ :index | 
		"I'm faking the names here. Calculating the hash will yield a different result!"
		(GitBlob bytes: 'content', index asString in: repository)
			instVarNamed: 'integerHash' put: (sortedHashes at: index);
			store ].	