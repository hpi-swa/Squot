user requests
actionAddOrRemoveTrackedPackages
	
	^ self withUnitOfWork: [SquitPackageChooser chooseFor: self projectSelection]