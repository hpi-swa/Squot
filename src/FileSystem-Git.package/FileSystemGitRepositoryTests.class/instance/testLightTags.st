tests
testLightTags
	| master branch1 tags git |
	git := self unitOfWork.
	master := git resolveRef: 'refs/heads/master'.
	branch1 := git resolveRef: 'refs/heads/branch1'.
	git 
		updateRef: 'refs/tags/version4.3alpha' to: master;
		updateRef: 'refs/tags/fail' to: branch1.
	tags := repository tags.
	self assert: tags size = 2.
	tags do: [ :each |
		self assert: each species = GitFilesystem.
		self assert: ({ master. branch1} includes: each revision hexHash) ]