actions
untrack: aPackage

	self trackedPackages remove: aPackage.
	
	self updateUntrackedPackages.
	
	self updateUntrackedPackages.
	self changed: #trackedPackagesWithTitle.
	self changed: #untrackedPackagesWithTitle.
	selectionTracked ifNotNil:
		[self selectionTracked: (selectionTracked min: trackedPackages size + 1 "title")].
	selectedUntrackedPackages add: aPackage.
	selectedTrackedPackages remove: aPackage ifAbsent: [].
	self changed: #selectionsTrackedAt:.
	self changed: #selectionsUntrackedAt:.
	self changed: #hasTrackedSelections.
	self changed: #hasUntrackedSelections.
	"Scroll updates into view"
	self selectionUntracked: (untrackedPackages indexOf: aPackage) + 1 "title".