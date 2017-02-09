private
captureSquotSnapshotFrom: aMCVersionInfo basedOnVersion: aSquotVersion
	| mcVersion |
	self flag: 'TODO: use aSquotVersion once "incremental" updating is available'.
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