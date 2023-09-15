toolbuilder
buildVersion: aFormOrNil with: builder
	^ builder pluggableScrollPaneSpec new	
		morph: (self versionAsMorph: aFormOrNil);
		padding: 5 px;
		yourself