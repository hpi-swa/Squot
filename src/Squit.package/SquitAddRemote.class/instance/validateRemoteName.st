validating
validateRemoteName
	^ [GitReference validateReferenceName: self remoteName.
		true]
			on: GitInvalidReferenceName do: [:e | e return: false]