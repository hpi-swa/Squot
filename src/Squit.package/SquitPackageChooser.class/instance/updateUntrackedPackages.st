choosing packages
updateUntrackedPackages

	untrackedPackages := self categoriesPlusPrefixes reject: [:package |
		self trackedPackages anySatisfy: [:tracked | package beginsWith: tracked]]