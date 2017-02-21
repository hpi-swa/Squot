initialize-release
addToEffectiveUnlessIgnored: anArtifact
	(self isIgnored: anArtifact) ifTrue: [^ self].
	effective at: anArtifact path put: anArtifact.