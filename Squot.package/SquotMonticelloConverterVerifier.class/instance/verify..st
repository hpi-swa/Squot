as yet unclassified
verify: aVersion
	| originMCVersion packageArtifact |
	[originMCVersion := pendingMCVersions
		detect: [:each | each info message = aVersion message]
		ifNone: [SquotMonticelloConversionProblem signal: 'Bogus version message or ancestry'.
				^ self].
	packageArtifact := self findPackageIn: aVersion snapshot.
	originMCVersion snapshot = packageArtifact content
		ifFalse: [SquotMonticelloConversionProblem signal: 'Snapshots do not match']]
		ensure: [pendingVersions addAll: aVersion parents].