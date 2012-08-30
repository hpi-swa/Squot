tests
testLightTags
	| master branch1 tags |
	master := basicRepository resolveRef: 'refs/heads/master'.
	branch1 := basicRepository resolveRef: 'refs/heads/branch1'.
	basicRepository 
		updateRef: basicRepository tagsDir / 'version 4.3alpha' to: master;
		updateRef: basicRepository tagsDir / 'fail' to: branch1.
		
	tags := repository tags.
	self assert: tags size = 2.
	tags do: [ :each |
		self assert: each species = GitFilesystem.
		self assert: ({ master. branch1} includes: (each revision) signature) ]