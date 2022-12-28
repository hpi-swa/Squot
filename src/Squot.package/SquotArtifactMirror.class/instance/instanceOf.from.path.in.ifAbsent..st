accessing
instanceOf: anArtifact from: sourceProjectSnapshot path: aSequencebleCollection in: searchProjectSnapshot ifAbsent: absentBlock
	^ searchProjectSnapshot artifactAt: anArtifact id
		ifAbsent:
			["Compatibility with old snapshots where artifacts did not have ids yet."
			| result |
			result := searchProjectSnapshot artifacts detect: [:each | each path = anArtifact path] ifNone: absentBlock.
			(result isNil or: [result id isNil])
				ifTrue: [result]
				ifFalse: [absentBlock value]]