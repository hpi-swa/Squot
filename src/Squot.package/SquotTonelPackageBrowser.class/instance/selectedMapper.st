accessing
selectedMapper
	^ self mappers detect: [:each | each package name = self selectedPackageName] ifNone: [nil]