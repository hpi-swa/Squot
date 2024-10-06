validation
checkValidRemoteName
	[GitReference validateReferenceName: self remoteName]
		on: GitInvalidReferenceName
		do: [:error | self inform: 'Invalid reference name: ', error messageText. ^ false].
	^ true