toolbuilder
buildCommitList: builder
	^ builder pluggableTreeSpec new
		model: self;
		hScrollBarPolicy: #whenNeeded;
		roots: #commitList;
		nodeClass: SquitVersionWrapper;
		getSelected: #commitSelection;
		setSelected: #commitSelection:;
		menu: #commitListMenu:;
		dragItem: #dragFromCommitList:;
		dropAccept: #wantsCommitListDrop:type:from:;
		dropItem: #dropOnCommitList:on:copyIndicated:;
		keyPress: #commitListKey:from:;
		columns: {
				[:listMorph | (listMorph filteredItems collect: [:item |
					item preferredWidthOfColumn: 1]) max].
				[:listMorph | (listMorph filteredItems collect: [:item |
					item preferredWidthOfColumn: 2]) max].
				nil "take all the space"};
		frame: (LayoutFrame new leftFraction: 0 offset: 0;
					 topFraction: 0 offset: 0;
					 rightFraction: 1 offset: 0;
					 bottomFraction: 0.96 offset: -15)