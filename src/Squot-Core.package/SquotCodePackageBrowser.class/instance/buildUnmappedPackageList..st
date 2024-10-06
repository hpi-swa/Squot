toolbuilder
buildUnmappedPackageList: builder
	^ builder pluggableListSpec new
		model: self;
		list: #unmappedPackageList;
		getSelected: #selectedPackageName;
		setSelected: #selectedPackageName:;
		yourself