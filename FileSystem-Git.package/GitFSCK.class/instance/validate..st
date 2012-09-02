public-validating
validate: anObject
	[ anObject validate ]
		on: GitError
		do: [ :error | self collectError: error for: anObject ]