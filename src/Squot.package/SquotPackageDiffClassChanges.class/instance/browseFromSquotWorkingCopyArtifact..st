browsing
browseFromSquotWorkingCopyArtifact: aWorkingCopyArtifact
	| environment behavior classTraitName |
	environment := PackageInfo squotEnvironmentOf: aWorkingCopyArtifact.
	behavior := environment classOrTraitNamed: className.
	behavior ifNil:
		["Could be a class trait."
		behavior := environment classOrTraitNamed:
			(classTraitName := className copyReplaceAll: ' classSide' with: ' classTrait')].
	behavior ifNil:
		["could be a class from another package, with extension methods"
		behavior := environment valueOf: className].
	behavior ifNil:
		["Could be a class trait from another package..."
		behavior := environment valueOf: classTraitName].
	behavior isBehavior ifFalse: [^ self inform: 'Class or trait not found!'].
	behavior browse.