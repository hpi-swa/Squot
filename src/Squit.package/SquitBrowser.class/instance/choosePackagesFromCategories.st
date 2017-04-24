actions
choosePackagesFromCategories
	"self new choosePackagesFromCategories"
	| packageNames selection alreadyTrackedPackageNames |
	alreadyTrackedPackageNames := self packagesInCurrentStore.
	packageNames := self categoriesPlusPrefixes reject: [:each |
		alreadyTrackedPackageNames anySatisfy: [:tracked | each beginsWith: tracked]].
	selection := UIManager default
		chooseMultipleFrom: packageNames
		values: packageNames
		title: 'Choose Packages To Track:'.
	selection ifNil: [^ #()].
	selection ifEmpty: [UIManager default inform: 'Nothing selected.'. ^ #()].
	selection := selection reject: [:each |
		selection anySatisfy: [:other | (each beginsWith: other) and: [each size ~~ other size]]].
	^ selection