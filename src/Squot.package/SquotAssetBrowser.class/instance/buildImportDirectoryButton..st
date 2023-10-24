toolbuilder
buildImportDirectoryButton: builder
	^ builder pluggableActionButtonSpec new
		model: self;
		action: #actionImportDirectory;
		label: 'Import directory';
		help: 'Choose a directory and import all (deeply) nested files.';
		yourself