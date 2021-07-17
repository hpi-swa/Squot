serializing
writeMCSnapshot: aMonticelloSnapshot forPackageNamed: aString from: anArtifact
	(TonelWriterForFileSystem on: directory parent "the writer creates the package directory")
		packageName: aString;
		writeSnapshot: aMonticelloSnapshot.