as yet unclassified
verify: aVersion
	| originMCVersion missingVersionInfo packageArtifact mcTraits artifactSnapshot patch |
	[originMCVersion := pendingMCVersions
		detect: [:each | each info message = aVersion message]
		ifNone: [missingVersionInfo := missingMCVersions
				detect: [:each | each message = aVersion message]
				ifNone: [SquotMonticelloConversionProblem signal: 'Bogus version message or ancestry'.
					^ self].
			self flag: #hack. "the ensure block needs originMCVersion, so fake one"
			originMCVersion := FakeMCVersion new info: missingVersionInfo; yourself.
			^ self "skip snapshot comparison, since we have no snapshot to check against"].
	pendingMCVersions remove: originMCVersion ifAbsent: [].
	packageArtifact := self findPackageIn: aVersion snapshot.
	"Monticello fails to store trait comments, so ignore them here."
	mcTraits := (originMCVersion snapshot definitions
		select: [:each | (each isKindOf: MCTraitDefinition) and: [each comment isEmpty]])
		collect: [:each | each className] as: Set.
	artifactSnapshot := MCSnapshot
		fromDefinitions: (packageArtifact content definitions
			collect: [:each |
				((each isKindOf: MCTraitDefinition) and: [mcTraits includes: each className])
					ifTrue: [each copy instVarNamed: 'comment' put: ''; yourself]
					ifFalse: [each]]
			as: originMCVersion snapshot definitions species).
	originMCVersion snapshot definitions sorted = artifactSnapshot definitions sorted
		ifFalse: [
			patch := packageArtifact content patchRelativeToBase: originMCVersion snapshot.
			SquotMonticelloConversionProblem signal: 'Snapshots do not match']]
		ensure: [pendingVersions addAll: aVersion parents.
			originMCVersion
				ifNotNil: [self pushAncestorsOfMCVersionInfo: originMCVersion info]].