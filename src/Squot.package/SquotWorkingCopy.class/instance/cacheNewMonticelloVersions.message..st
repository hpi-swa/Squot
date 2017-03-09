private creating new versions
cacheNewMonticelloVersions: finalSnapshot message: messageText
	finalSnapshot artifactsDo: [:each | each ifPresent: [
		(each storeInfo at: #objectClassName ifAbsent: []) = #PackageInfo
			ifTrue: [self cacheNewMonticelloVersion: each message: messageText]]]