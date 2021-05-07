tests
testLazyLoading
	| entries contents |
	entries := #(
		'/'
		'/file1' '/file2' '/file3'
		'/dir1' '/dir1/file1' '/dir1/file2' '/dir1/file3'
		'/dir2' '/dir2/file1' '/dir2/file2' '/dir2/file3'
		'/dir2/dir2.1' '/dir2/dir2.1/file1' '/dir2/dir2.1/file2' '/dir2/dir2.1/file3').
	repository withUnitOfWork: [
	self assert: ((repository head root allChildren collect: [ :each |
		each fullName ]) includesAllOf: entries).
	contents := (repository head / 'file1')
		readStreamDo: [ :stream | stream contents asString ].
	self assert: contents = 'file1'
	].