tests
testCreateReferencedDirectory
	| filesystem |
	filesystem := FileSystem memory.
	reference := filesystem root resolve: 'alpha/beta/gamma/repo.git'.
	repository := GitRepository on: reference.
	
	filesystem root allChildren do: [:each | self assert: each exists].
	
	filesystem := FileSystem memory.
	reference := filesystem root resolve: '/alpha/beta/repo.git'.
	(filesystem root / 'alpha') createDirectory.
	repository := GitRepository on: reference.
	
	self 
		shouldnt: [repository gitInitialize]
		raise: FSDirectoryExists
		description: 'The code should check if one of parent directories exists before trying to create it'.
	self assert: (filesystem root / 'alpha') exists.
	self assert: (filesystem root / 'alpha' / 'beta') exists.
	self assert: (filesystem root / 'alpha' / 'beta' / 'repo.git') exists.