public-validating
validateHead
	self validateHeadFile.
	[ repository unitOfWork head ifNotNilDo: [ :head | self visit: head ] ]
		on: GitError
		do: [ :error | 
			self collectError: error for: repository ]