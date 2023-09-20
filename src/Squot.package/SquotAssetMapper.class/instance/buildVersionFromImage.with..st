toolbuilder
buildVersionFromImage: aWorkingCopy with: builder
	^ self
		buildVersion: (self loadVersionFromImage: aWorkingCopy)
		with: builder