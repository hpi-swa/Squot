as yet unclassified
verify: aVersion matches: aMCVersion
	| artifactSnapshot mcSnapshot mcTraits packageArtifact patch |
	packageArtifact := self findPackageIn: aVersion snapshot.
	mcSnapshot := aMCVersion snapshot.
	"Monticello fails to store trait comments, so ignore them here."
	mcTraits := (mcSnapshot definitions
		select: [:each | (each isKindOf: MCTraitDefinition) and: [each comment isEmpty]])
		collect: [:each | each className] as: Set.
	artifactSnapshot := MCSnapshot
		fromDefinitions: (packageArtifact packageArtifactDefinitions
			collect: [:each |
				((each isKindOf: MCTraitDefinition) and: [mcTraits includes: each className])
					ifTrue: [each copy instVarNamed: 'comment' put: ''; yourself]
					ifFalse: [each]]
			as: aMCVersion snapshot definitions species).
	(patch := artifactSnapshot patchRelativeToBase: mcSnapshot) isEmpty
		ifFalse:
			[SquotMonticelloSnapshotsNotEqual
				signalMismatchBetween: aVersion and: aMCVersion
				artifact: packageArtifact withMonticelloSnapshot: artifactSnapshot]