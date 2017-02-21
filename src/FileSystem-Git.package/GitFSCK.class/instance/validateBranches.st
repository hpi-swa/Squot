public-validating
validateBranches
	[ repository branches do: [ :head| self visit: head ] ]
		on: GitError
		do: [ :error | 
			self collectError: error for: repository ]