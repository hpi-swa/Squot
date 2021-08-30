as yet unclassified
browseRepository

	((self selectedRepository ifNil: [^ self]) store artifacts collect: #object) detect: [:artifact | artifact isKindOf: PackageInfo] ifFound: #browse