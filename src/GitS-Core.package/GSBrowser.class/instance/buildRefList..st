toolbuilder
buildRefList: builder
	^ builder pluggableTreeSpec new
		model: self;
		roots: #refList;
		getSelected: #activeRef;
		setSelected: #activeRef:;
		nodeClass: GSRefWrapper;
		menu: #refListMenu:;
		yourself