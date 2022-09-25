initialize artifacts
initializeArtifact: anArtifact forObject: aShadow
	| packageReference packageName path |
	packageReference := ((anArtifact storeInfo at: 'references') detect: [:each | (each value at: 'type') = 'package' and: ['application/*.smalltalk.cypress' match: (each value at: 'content-type')]]) value.
	packageName := packageReference at: 'packageName'.
	self flag: #todo. "Should the path be rather stored in the reference?"
	path := anArtifact storeInfo at: 'path'.
	path := SquotCypressCodeSerializer rewritePath: path ofPackage: (SquotPackageShadow forPackageNamed: packageName withSnapshot: nil tonelProperties: nil).
	anArtifact storeInfo at: 'path' put: path.