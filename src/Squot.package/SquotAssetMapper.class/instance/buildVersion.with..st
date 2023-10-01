toolbuilder
buildVersion: anObject with: builder
	^ builder pluggableScrollPaneSpec new	
		morph: (self versionOrNilAsMorph: anObject);
		padding: 5 px;
		minimumExtent: 100 @ 100;
		yourself