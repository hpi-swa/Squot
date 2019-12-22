*Squot-Tools
browseFromSquotWorkingCopyArtifact: aSquotWorkingCopyArtifact
	^ (PackageInfo squotEnvironmentOf: aSquotWorkingCopyArtifact) packageOrganizer
		packageNamed: self packageName
		ifPresent:
			[:packageInfo |
			(packageInfo perform: self scriptSelector)
				openLabel: self scriptSelector, ' of package ', self packageName]