public-validating
validateHeadFile
	[ repository headFile exists ifFalse: [ GitInvalidRepositoryError signal: 'Could not find ''HEAD''' ] ]
		on: GitError
		do: [ :error |
			self collectError: error for: repository ]