ui toolbuilder
buildButtonBar: builder
	| buttonBar cancelButton commitButton |
	buttonBar := super buildButtonBar: builder.
	commitButton := buttonBar children first.
	commitButton
		label: 'Commit';
		help: nil;
		action: #actionCommit.
	cancelButton := buttonBar children second.
	cancelButton
		help: nil.
	^ buttonBar