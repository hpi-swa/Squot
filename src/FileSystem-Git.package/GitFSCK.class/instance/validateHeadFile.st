public-validating
validateHeadFile
	[ (repository followSymbolicRefs: 'HEAD') ~= 'HEAD' ifFalse: [ GitInvalidRepositoryError signal: 'Could not find ''HEAD''' ] ]
		on: GitError
		do: [ :error |
			self collectError: error for: repository ]