private creating new versions
cacheNewMonticelloVersions: aPatch message: messageText
	(aPatch diffs select: [:each | each hasChanges and: [each right isPresent]]) do: [:each |
		(each right storeInfo at: #objectClassName ifAbsent: []) = #PackageInfo
			ifTrue: [self cacheNewMonticelloVersion: each message: messageText]]
	displayingProgress: 'Creating Monticello versions in the package cache as backup'