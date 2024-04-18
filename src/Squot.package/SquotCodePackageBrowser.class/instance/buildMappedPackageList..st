toolbuilder
buildMappedPackageList: builder
	^ builder pluggableListSpec new
		model: self;
		list: #mappedPackageList;
		getSelected: #selectedPackageName;
		setSelected: #selectedPackageName:;
		yourself