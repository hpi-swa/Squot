toolbuilder
buildAddPackageButton: builder
	^ builder pluggableActionButtonSpec new
		model: self;
		action: #actionAddPackage;
		enabled: #isSelectedPackageUnmapped;
		label: 'Add package';
		yourself