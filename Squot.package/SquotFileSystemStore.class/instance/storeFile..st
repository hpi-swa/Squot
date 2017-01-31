private snapshot building
storeFile: anArtifact
	| source target |
	source := anArtifact fileReference.
	target := directory resolve: anArtifact path.
	(source = target and: [source filesystem == target filesystem]) ifTrue: [^ self].
	[source copyTo: target] on: FSFileExists do: [:e | e resume].