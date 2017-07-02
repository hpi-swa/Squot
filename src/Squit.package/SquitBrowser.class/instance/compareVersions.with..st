actions on versions
compareVersions: leftVersion with: rightVersion
	(SquotDiffExplorer
		from: leftVersion snapshot
		to: rightVersion snapshot)
	openLabel: 'Comparing versions'.