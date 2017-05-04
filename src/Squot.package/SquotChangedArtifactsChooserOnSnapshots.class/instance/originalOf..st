accessing
originalOf: anArtifact
	^ original at: anArtifact path ifAbsent: [anArtifact absentCopy]