toolbuilder
buildResolveButton: aSelector with: builder
	^ builder pluggableActionButtonSpec new
		model: self changeSet;
		action: aSelector;
		label: 'Resolve to this version';
		yourself