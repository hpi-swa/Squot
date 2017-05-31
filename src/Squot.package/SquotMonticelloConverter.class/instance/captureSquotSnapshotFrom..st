private
captureSquotSnapshotFrom: aMCVersionInfo
	| mcVersion |
	mcVersion := monticelloRepository versionWithInfo: aMCVersionInfo.
	mcVersion ifNil: [^ nil].
	^ SquotSnapshot builder
		add: (SquotArtifact new
			content: mcVersion snapshot;
			path: mcVersion package name, '.package';
			in: [:artifact | artifact
				initializeDefaultStoreInfoFor: mcVersion package packageInfo];
			yourself);
		buildSnapshot