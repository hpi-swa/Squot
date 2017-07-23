actions on versions
compareVersions: leftVersion with: rightVersion
	(SquotDiffExplorer from: leftVersion to: rightVersion) openLabel: 'Comparing versions'.