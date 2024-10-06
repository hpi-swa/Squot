ui
unmappedPackageList
	^ (self categoriesPlusPrefixes reject: [:category |
		self mappedPackageList anySatisfy: [:package |
			category = package or: [category beginsWith: package, '-']]])
		sorted