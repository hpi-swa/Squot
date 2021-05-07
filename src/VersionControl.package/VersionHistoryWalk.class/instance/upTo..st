accessing
upTo: aVersion
	"Answer all versions that are not ancestors of aVersion, excluding aVersion itself."
	
	self excludeAncestorsOf: aVersion.
	^ self upToEnd