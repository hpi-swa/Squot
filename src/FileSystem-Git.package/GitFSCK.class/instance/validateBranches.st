public-validating
validateBranches
	[ repository unitOfWork branches do: [ :head| self visit: head ] ]
		on: GitError
		do: [ :error | 
			self collectError: error for: repository ]