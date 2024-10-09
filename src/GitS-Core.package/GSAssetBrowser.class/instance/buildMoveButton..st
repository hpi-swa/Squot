toolbuilder
buildMoveButton: builder
	^ builder pluggableActionButtonSpec new
		model: self;
		action: #actionMove;
		label: 'Move asset';
		yourself