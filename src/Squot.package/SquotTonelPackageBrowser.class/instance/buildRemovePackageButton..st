toolbuilder
buildRemovePackageButton: builder
	^ builder pluggableActionButtonSpec new
		model: self;
		action: #actionRemovePackage;
		enabled: #isSelectedPackageMapped;
		label: 'Remove package';
		yourself