reflection
mirrorOf: anArtifact reachedVia: aSquotArtifactReference from: aSquotLegacySnapshotAdapter 
	self assert: self == aSquotLegacySnapshotAdapter.
	^ snapshot mirrorOf: anArtifact reachedVia: aSquotArtifactReference from: snapshot