toolbuilder
buildMainLayout: builder
	^ GSGUIUtilities buildHorizontalSplit: 0.5
		of: (self buildUnmappedPackageList: builder)
		and: (self buildMappedPackageList: builder)
		with: builder