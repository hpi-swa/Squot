tests
testRetrievingBytes
	| blob |
	blob := GitBlob bytes: 'testBlob' in: nil.
	self assert: blob bytes = ('testBlob' asByteArray).
	
	blob := GitBlob bytes: 3242 in: nil.
	self assert: blob bytes = (3242 asByteArray).
	
	blob := GitBlob bytes: #[3 42 45 3] in: nil.
	self assert: blob bytes = #[3 42 45 3]