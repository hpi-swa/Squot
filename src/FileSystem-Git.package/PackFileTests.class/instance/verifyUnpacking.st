verifying
verifyUnpacking
	| files filenames |
	files := [ (filesystem root resolve: 'repo/.git/objects') allFiles ].
	self assert: files value size = 2.
	(GitPackFile on: packFile in: repository) unpack.
	self assert: files value size = 11.
	files := files value reject: [ :reference | 
		(reference basename endsWith: 'pack')
		or: [ reference basename endsWith: 'idx' ] ].
	
	filenames := #(
		'a21a7e0e910cf24f3c455cc6e0ea86d589a0db'
		'f6939ef44d5fadc3f537300b42e4b2889cc415'
		'022a3c03d87ef1487d282ad8c8c57941469417'
		'511757325072abacc21fc749c7000461dbc857'
		'0101a2d57b40c37da9b42b688e61eb968f943e'
		'564e36d46a682f13e716b6f5e13d94cd9461b7'
		'bf7c56584e5e2a7d51f27ea9eec36cc2695b72'
		'f6defb3f5b3e6d851165c8c38c18ba42b5649b'
		'6064b187da14ddaab211e6579a225f179083e7' ) asOrderedCollection.
	
	self assert: files size = 9.
	files do: [ :reference |
		self assert: (filenames includes: reference basename).
		filenames remove: reference basename ].
	self assert: filenames isEmpty