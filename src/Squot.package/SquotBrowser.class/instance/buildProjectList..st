toolbuilder
buildProjectList: builder
	^ SquotProjectList
		model: self
		get: #activeWorkingCopy
		set: #activeWorkingCopy:
		menu: #projectListMenu:
		buildWith: builder