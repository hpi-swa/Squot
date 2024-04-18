toolbuilder
buildEditPackagePathButton: builder
	^ builder pluggableActionButtonSpec new
		model: self;
		action: #actionEditPackagePath;
		enabled: #isSelectedPackageMapped;
		label: 'Edit package path';
		help: 'Edit the path where the package is stored within the repository.';
		yourself