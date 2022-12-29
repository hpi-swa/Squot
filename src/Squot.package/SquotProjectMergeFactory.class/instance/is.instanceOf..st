callbacks for objects
is: anArtifact instanceOf: anotherArtifact
	^ anArtifact notNil & anotherArtifact notNil and: [anArtifact id = anotherArtifact id
		or:
			["Compatibility with old snapshots where artifacts did not have ids yet."
			anArtifact id isNil | anotherArtifact id isNil and: [anotherArtifact path = anArtifact path]]]