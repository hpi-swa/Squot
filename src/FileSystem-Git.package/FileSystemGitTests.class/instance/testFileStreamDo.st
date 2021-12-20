tests-references
testFileStreamDo
	[super testFileStreamDo]
		on: Deprecation do: [:d | d resume].