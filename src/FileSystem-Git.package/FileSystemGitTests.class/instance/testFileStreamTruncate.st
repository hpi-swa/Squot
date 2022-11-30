tests-references
testFileStreamTruncate
	[super testFileStreamTruncate]
		on: Deprecation do: [:d | d resume].