toolbuilder
buildImportDirectoryButton: builder
	^ builder pluggableActionButtonSpec new
		model: self;
		action: #actionImportDirectory;
		label: 'Import Directory';
		help: 'Choose a directory and import all (deeply) nested files.';
		yourself