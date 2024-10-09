toolbuilder
buildRefTree: builder
	^ builder pluggableTreeSpec new
		model: self;
		roots: #refTreeRoots;
		getSelected: #activeRefTreeMember;
		setSelected: #activeRefTreeMember:;
		nodeClass: GSRefTreeMemberWrapper;
		menu: #refListMenu:;
		yourself