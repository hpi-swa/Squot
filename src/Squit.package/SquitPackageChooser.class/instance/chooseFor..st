choosing packages
chooseFor: aWorkingCopy
	"returns true if any changes were made"

	| originalPackages addedPackages removedPackages subPath |
	acceptChanges := false.
	trackedPackages := self packagesIn: aWorkingCopy.
	originalPackages := trackedPackages copy.
	self updateUntrackedPackages.
	
	ToolBuilder open: self.
	acceptChanges ifFalse: [^ false].
	
	removedPackages := originalPackages reject: [:package | self trackedPackages includes: package].
	addedPackages := self trackedPackages reject: [:package | originalPackages includes: package].
	(removedPackages isEmpty and: [addedPackages isEmpty]) ifTrue: [^ false].
	
	addedPackages ifNotEmpty: [
		subPath := self requestPathInWorkingCopy: aWorkingCopy.
		subPath ifNil: [^ false]].
	
	removedPackages do: [:each | aWorkingCopy remove: (self objectForPackageName: each from: aWorkingCopy)].
	addedPackages do: [:each | aWorkingCopy addPackageNamed: each at: subPath].
	^ true