actions on versions
compareVersions: leftVersion with: rightVersion
	(SquotDiffExplorer from: leftVersion to: rightVersion)
		workingCopy: self projectSelection;
		openLabel: 'Comparing versions'.