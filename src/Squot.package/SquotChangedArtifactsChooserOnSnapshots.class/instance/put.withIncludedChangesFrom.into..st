results
put: anArtifact withIncludedChangesFrom: aDiffNode into: aStream
	"Patch anArtifact by the diff in aDiffNode and children and put the patched artifact into aStream"
	aDiffNode isActive ifFalse: [^ self "do not collect unchanged artifacts"].
	aStream nextPut: (anArtifact copyWithDiffApplied: (artifactDiffs at: aDiffNode title) updatedFromNodes).