toolbuilder
buildChildrenInto: aMorph with: builder
	self children do: [:each |
		aMorph isInWorld ifFalse: [^ self "break"].
		aMorph addMorphBack: (each buildWith: builder).
		
		self flag: #todo. "workaround for layout bug"
		Project current addDeferredUIMessage: [aMorph layoutChanged].
		
		self wait].