public-validating
validate: anObject
	[ anObject validate; validateStoredObject ]
		on: GitError
		do: [ :error | self collectError: error for: anObject ]