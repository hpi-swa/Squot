actions on versions
compareVersions: leftVersion with: rightVersion
	self withUnitOfWork: 
		[(SquotDiffExplorer from: leftVersion to: rightVersion)
			workingCopy: self projectSelection;
			openLabel: 'Comparing versions'].