choosing packages
updateUntrackedPackages

	untrackedPackages := self categoriesPlusPrefixes reject: [:package | trackedPackages anySatisfy: [:tracked | package beginsWith: tracked]].