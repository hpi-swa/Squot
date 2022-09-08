*Squot-Tools
browseFromSquotWorkingCopyArtifact: aSquotWorkingCopyArtifact
	aSquotWorkingCopyArtifact isLoaded ifFalse: [^ self browse].
	^ (PackageInfo squotEnvironmentOf: aSquotWorkingCopyArtifact) packageOrganizer
		packageNamed: self packageName
		ifPresent:
			[:packageInfo |
			(packageInfo perform: self scriptSelector)
				openLabel: self scriptSelector, ' of package ', self packageName]