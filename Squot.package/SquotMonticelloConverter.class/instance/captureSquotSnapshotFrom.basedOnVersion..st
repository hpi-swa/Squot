private
captureSquotSnapshotFrom: aMCVersionInfo basedOnVersion: aSquotVersion
	| mcVersion |
	self flag: 'TODO: use aSquotVersion once "incremental" updating is available'.
	^ SquotSnapshot builder
		add: (SquotArtifact new
			content: (mcVersion := monticelloRepository versionWithInfo: aMCVersionInfo) snapshot;
			path: mcVersion package name, '.package';
			in: [:artifact | artifact
				initializeDefaultStoreInfoFor: mcVersion package packageInfo];
			yourself);
		buildSnapshot