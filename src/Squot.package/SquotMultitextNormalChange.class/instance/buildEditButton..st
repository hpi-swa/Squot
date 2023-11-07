toolbuilder
buildEditButton: builder
	^ builder pluggableActionButtonSpec new
		model: self;
		action: #toggleEditMode;
		label: #editButtonLabel;
		verticalResizing: #shrinkWrap;
		padding: 4 px;
		yourself