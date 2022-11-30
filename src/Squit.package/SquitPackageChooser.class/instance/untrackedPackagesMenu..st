toolbuilder
untrackedPackagesMenu: menu

	^ menu
		add: 'Select all' action: #selectAllUntrackedPackages;
		add: 'Select inversion' action: #selectInverseUntrackedPackages;
		add: 'Select none' action: #selectNoUntrackedPackages;
		yourself