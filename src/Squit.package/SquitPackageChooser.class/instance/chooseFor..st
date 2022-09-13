choosing packages
chooseFor: aWorkingCopy
	"returns true if any changes were made"

	| originalPackages addedPackages removedPackages subPath |
	acceptChanges := false.
	trackedPackages := (self packagesIn: aWorkingCopy) asSortedCollection.
	selectedTrackedPackages := Set new.
	selectedUntrackedPackages := Set new.
	originalPackages := trackedPackages copy.
	self updateUntrackedPackages.
	
	ToolBuilder open: self.
	acceptChanges ifFalse: [^ false].
	
	removedPackages := originalPackages copyWithoutAll: self trackedPackages.
	addedPackages := self trackedPackages copyWithoutAll: originalPackages.
	(removedPackages isEmpty and: [addedPackages isEmpty]) ifTrue: [^ false].
	
	addedPackages ifNotEmpty: [
		subPath := self requestPathInWorkingCopy: aWorkingCopy.
		subPath ifNil: [^ false]].
	
	removedPackages do: [:each | aWorkingCopy removePackageNamed: each].
	addedPackages do: [:each | aWorkingCopy addPackageNamed: each at: subPath].
	^ true