toolbuilder
buildProjectList: builder
	^ GSProjectList
		model: self
		get: #activeWorkingCopy
		set: #activeWorkingCopy:
		menu: #projectListMenu:
		buildWith: builder