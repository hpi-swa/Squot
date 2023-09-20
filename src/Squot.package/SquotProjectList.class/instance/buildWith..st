toolbuilder
buildWith: builder
	^ builder pluggableListSpec new
		model: self;
		list: #list;
		getSelected: #project;
		setSelected: #project:;
		menu: #menu:;
		yourself