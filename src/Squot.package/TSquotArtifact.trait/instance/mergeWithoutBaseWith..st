merging
mergeWithoutBaseWith: anArtifact
	| merge diff |
	merge := SquotArtifactMerge new working: self; incoming: anArtifact.
	diff := self diffAgainst: anArtifact.
	diff hasChanges ifTrue: [diff addDifferencesAsConflicts: merge].
	^ merge