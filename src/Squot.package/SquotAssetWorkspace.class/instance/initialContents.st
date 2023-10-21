initialize-release
initialContents
	^ '"Edit {1} by entering and saving code here. ',
	'The code must produce a {2}{3}."' format: {
		self editTargetName.
		self versionOrNilTypeName.
		self variablesString.
	}