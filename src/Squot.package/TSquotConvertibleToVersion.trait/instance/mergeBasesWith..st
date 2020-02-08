accessing ancestry
mergeBasesWith: otherVersion
	^ (VersionsMergeBase
		of: (self asSquotVersionIn: self repository)
		and: (otherVersion asSquotVersionIn: self repository))
		
		allVersions