as yet unclassified
signalMismatchBetween: aSquotVersion and: aMCVersion
	artifact: aSquotArtifact withMonticelloSnapshot: aMCSnapshot
	^ self new
		messageText: aMCVersion name;
		squotVersion: aSquotVersion;
		mcVersion: aMCVersion;
		packageArtifact: aSquotArtifact;
		artifactMcSnapshot: aMCSnapshot;
		mcSnapshot: aMCVersion snapshot;
		signal