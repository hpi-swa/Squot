public-validating
validateHeadFile
	[ (repository unitOfWork followSymbolicRefs: 'HEAD') ~= 'HEAD' ifFalse: [ GitInvalidRepositoryError signal: 'Could not find ''HEAD''' ] ]
		on: GitError
		do: [ :error |
			self collectError: error for: repository ]