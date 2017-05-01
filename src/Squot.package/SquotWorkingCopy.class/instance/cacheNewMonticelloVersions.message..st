private creating new versions
cacheNewMonticelloVersions: finalSnapshot message: messageText
	finalSnapshot artifacts do: [:each | each ifPresent: [
		(each storeInfo at: #objectClassName ifAbsent: []) = #PackageInfo
			ifTrue: [self cacheNewMonticelloVersion: each message: messageText]]]
	displayingProgress: 'Creating Monticello versions in the package cache as backup'