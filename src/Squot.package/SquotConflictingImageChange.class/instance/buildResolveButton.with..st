toolbuilder
buildResolveButton: aSelector with: builder
	^ builder pluggableActionButtonSpec new
		model: self changeSet;
		action: aSelector;
		label: 'Resolve to this version';
		padding: 4 px;
		verticalResizing: #shrinkWrap;
		yourself
