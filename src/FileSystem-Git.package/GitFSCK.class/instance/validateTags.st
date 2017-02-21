public-validating
validateTags
	[ repository tags do: [ :tag | self visit: tag ] ]
		on: GitError
		do: [ :error | 
			self collectError: error for: repository ]