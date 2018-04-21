as yet unclassified
chooseFor: aWorkingCopy

	applyChanges := true.
	trackedPackages := self packagesIn: aWorkingCopy.
	untrackedPackages := self categoriesPlusPrefixes reject: [:each |
		trackedPackages anySatisfy: [:tracked | each beginsWith: tracked]].
	
	ToolBuilder open: self.
	
	applyChanges ifFalse: [^ #()].
	self halt.
	^ #()
	
	"selection := selection reject: [:each |
		selection anySatisfy: [:other | (each beginsWith: other) and: [each size ~~ other size]]].
	^ selection"