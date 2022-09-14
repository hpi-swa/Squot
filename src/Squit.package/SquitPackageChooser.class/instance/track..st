actions
track: aPackage

	| conflictingPackages packageInfo |
	packageInfo := PackageInfo new packageName: aPackage; yourself.
	conflictingPackages := self trackedPackages select:
		[:p | packageInfo includesSystemCategory: p].
	
	conflictingPackages ifNotEmpty: [
		self selectionUntracked: (self trackedPackagesWithTitle indexOf: aPackage).
		(self confirm: 'To add this package, we will first remove ',
			(conflictingPackages joinSeparatedBy: ', '),
			', because the new package is a prefix/super package for these.', String cr,
			'(Otherwise the package contents will be duplicated)') ifFalse: [^ self]].

	self trackedPackages
		removeAll: conflictingPackages;
		add: aPackage.
	
	self updateUntrackedPackages.
	self changed: #trackedPackagesWithTitle.
	self changed: #untrackedPackagesWithTitle.
	selectionUntracked ifNotNil:
		[self selectionUntracked: (selectionUntracked min: trackedPackages size + 1 "title")].
	selectedUntrackedPackages remove: aPackage ifAbsent: [].
	selectedTrackedPackages add: aPackage.
	selectedTrackedPackages removeAll: conflictingPackages.
	self changed: #selectionsTrackedAt:.
	self changed: #selectionsUntrackedAt:.
	self changed: #hasTrackedSelections.
	self changed: #hasUntrackedSelections.
	"Scroll updates into view"
	self selectionTracked: (trackedPackages indexOf: aPackage) + 1 "title".