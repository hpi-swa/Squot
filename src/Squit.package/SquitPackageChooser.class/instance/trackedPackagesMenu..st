toolbuilder
trackedPackagesMenu: menu

	^ menu
		add: 'Select all' action: #selectAllTrackedPackages;
		add: 'Select inversion' action: #selectInverseTrackedPackages;
		add: 'Select none' action: #selectNoTrackedPackages;
		yourself