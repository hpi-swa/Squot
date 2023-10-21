toolbuilder
buildImportUnmappedFilesButton: builder
	^ builder pluggableActionButtonSpec new
		model: self;
		action: #actionImportUnmappedFiles;
		label: 'Import Untracked Files';
		help: 'Scan the current commit for untracked files and import them.';
		yourself