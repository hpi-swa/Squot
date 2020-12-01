tests
testLookup
	| files directories ref |
	files := #(
		'/file1' '/file2' '/file3'
		'/dir1/file1' '/dir1/file2' '/dir1/file3'
		'/dir2/file1' '/dir2/file2' '/dir2/file3'
		'/dir2/dir2.1/file1' '/dir2/dir2.1/file2' '/dir2/dir2.1/file3').
	directories := #('/dir1' '/dir2' '/dir2/dir2.1').
	
	repository withUnitOfWork: [
	files do: [ :name |
		ref := workingCopy root resolve: name.
		self assert: ref exists.
		self assert: ref isFile ].
	directories do: [ :name |
		ref := workingCopy root resolve: name.
		self assert: ref exists.
		self assert: ref isDirectory ].
	
	self assert: workingCopy root children size = 5.
	self assert: workingCopy root entries size = 5.
	self assert: workingCopy root allChildren size = (files size + directories size + 1).
	self assert: workingCopy root allEntries size = (files size + directories size + 1).
	self assert: workingCopy root files size = 3.
	self assert: workingCopy root directories size = 2
	].