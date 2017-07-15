ancestry
isAncestorOf: aVersion
	^ (self mergeBasesWith: aVersion) includes: self