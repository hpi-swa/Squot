toolbuilder
buildProjectList: builder
	^ SquotProjectList
		model: self
		get: #activeWorkingCopy
		set: #activeWorkingCopy:
		buildWith: builder