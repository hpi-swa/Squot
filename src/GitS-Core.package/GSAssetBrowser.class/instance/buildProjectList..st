toolbuilder
buildProjectList: builder
	^ GSProjectList
		model: self
		get: #activeWorkingCopy
		set: #activeWorkingCopy:
		buildWith: builder