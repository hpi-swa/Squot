browsing
browseFromSquotWorkingCopyArtifact: aWorkingCopyArtifact
	| environment behavior |
	environment := PackageInfo squotEnvironmentOf: aWorkingCopyArtifact.
	behavior := environment classOrTraitNamed: className.
	behavior ifNil:
		["could be a class from another package, with extension methods"
		behavior := environment valueOf: className.
		behavior isBehavior ifFalse: [^ self inform: 'Class or trait not found!']].
	behavior browse.