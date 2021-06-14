private
captureSquotSnapshotFrom: aMCVersionInfo
	| mcVersion |
	mcVersion := monticelloRepository versionWithInfo: aMCVersionInfo.
	mcVersion ifNil: [^ nil].
	^ SquotSnapshot builder
		add: (mcVersion snapshot asSquotArtifactForPackage: mcVersion package packageInfo repository: squotRepository path: (self squotPathForMonticelloPackage: mcVersion package));
		buildSnapshot