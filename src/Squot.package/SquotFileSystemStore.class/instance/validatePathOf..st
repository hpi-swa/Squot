private storing
validatePathOf: anArtifact
	"Check that the path of the artifact is valid according to its serializer."
	| path |
	path := self validatePath: anArtifact path for: anArtifact.
	path ~= anArtifact path ifTrue:
		[self error: 'Invalid path to store ', anArtifact printString].
	^ path