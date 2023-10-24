toolbuilder
buildImportUnmappedFilesButton: builder
	^ builder pluggableActionButtonSpec new
		model: self;
		action: #actionImportUnmappedFiles;
		label: 'Import unmanaged files';
		help: 'Scan the current commit for files that aren''t managed by the Git Browser and import them.';
		yourself