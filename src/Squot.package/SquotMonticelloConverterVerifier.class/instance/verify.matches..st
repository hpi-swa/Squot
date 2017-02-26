as yet unclassified
verify: aVersion matches: aMCVersion
	| artifactSnapshot mcTraits packageArtifact patch |
	packageArtifact := self findPackageIn: aVersion snapshot.
	"Monticello fails to store trait comments, so ignore them here."
	mcTraits := (aMCVersion snapshot definitions
		select: [:each | (each isKindOf: MCTraitDefinition) and: [each comment isEmpty]])
		collect: [:each | each className] as: Set.
	artifactSnapshot := MCSnapshot
		fromDefinitions: (packageArtifact content definitions
			collect: [:each |
				((each isKindOf: MCTraitDefinition) and: [mcTraits includes: each className])
					ifTrue: [each copy instVarNamed: 'comment' put: ''; yourself]
					ifFalse: [each]]
			as: aMCVersion snapshot definitions species).
	(patch := packageArtifact content patchRelativeToBase: aMCVersion snapshot) isEmpty
		ifFalse: [
			SquotMonticelloConversionProblem signal: 'Snapshots do not match']