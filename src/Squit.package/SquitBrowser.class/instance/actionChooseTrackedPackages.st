user requests
actionChooseTrackedPackages
	
	^ self withUnitOfWork: [SquitPackageChooser chooseFor: self projectSelection]