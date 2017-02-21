as yet unclassified
findPackageIn: aSnapshot
	(aSnapshot artifactAt: mcPackage name, '.package')
		in: [:artifact | ^ artifact].
	"aSnapshot
		artifactsDo: [:each | (each path endsWith: mcPackage name, '.package')
				ifTrue: [^ each]]."
	SquotMonticelloConversionProblem signal: 'Cannot find package in snapshot'.