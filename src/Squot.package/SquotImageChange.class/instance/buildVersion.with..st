toolbuilder
buildVersion: aFormOrNil with: builder
	^ builder pluggableScrollPaneSpec new	
		morph: (self versionAsMorph: aFormOrNil);
		padding: 10;
		frame: LayoutFrame fullFrame;
		yourself