toolbuilder
buildRefList: builder
	^ builder pluggableTreeSpec new
		model: self;
		roots: #refList;
		getSelected: #activeRef;
		setSelected: #activeRef:;
		nodeClass: SquotRefWrapper;
		menu: #refListMenu:;
		yourself