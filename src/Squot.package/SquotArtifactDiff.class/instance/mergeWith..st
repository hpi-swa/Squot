merging
mergeWith: anArtifactDiff
	| merge |
	self assert: self left = anArtifactDiff left.
	self assert: self path = anArtifactDiff path.
	"double dispatch"
	merge := anArtifactDiff mergeWithDiff: self.
	(self willBeLoaded and: [merge willBeLoaded not]) ifTrue: [merge toggleWhetherToLoad].
	^ merge