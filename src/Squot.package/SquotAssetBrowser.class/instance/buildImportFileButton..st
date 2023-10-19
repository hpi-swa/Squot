toolbuilder
buildImportFileButton: builder
	^ builder pluggableActionButtonSpec new
		model: self;
		action: #actionImportFile;
		label: 'Import File';
		help: 'Choose a file and import it as an asset.';
		yourself