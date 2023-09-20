toolbuilder
buildVersion: anObject with: builder
	^ builder pluggableScrollPaneSpec new	
		morph: (self versionAsMorph: anObject);
		padding: 5 px;
		yourself