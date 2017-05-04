results
putProposed: anArtifact withoutExcludedChangesFrom: aDiffNode into: aStream
	"anArtifact is not currently loaded, there is no original for it.
	aDiffNode should describe it completely, but the excluded nodes must be subtracted.
	Apply the inverse of the excluded diff nodes to anArtifact and put the result into aStream."
	self assert: (original includesKey: anArtifact path) not.
	aDiffNode isActive ifFalse: [^ self "should not include the new artifact at all"].
	aStream nextPut: (anArtifact copyWithInverseOfExcludedDiffNodesApplied: aDiffNode).