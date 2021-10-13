actions
actionAddOrRemoveTrackedPackages
	
	^ self withUnitOfWork: [SquitPackageChooser chooseFor: self selectedRepository]