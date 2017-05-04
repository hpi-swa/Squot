adding and removing
add: anArtifactDiff
	| path |
	path := anArtifactDiff path.
	diffs at: path ifPresent: [:previous | previous ~= anArtifactDiff
		ifTrue: [Warning signal: 'conflict']].
	diffs at: anArtifactDiff path put: anArtifactDiff.