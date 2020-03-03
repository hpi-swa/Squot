accessing
workingCopyDir
	self flag: #stub.
	^ [repository workingCopyDir]
		on: Deprecation do: [:ex | ex resume]