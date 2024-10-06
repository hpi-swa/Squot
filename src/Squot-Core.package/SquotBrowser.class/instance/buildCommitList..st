toolbuilder
buildCommitList: builder
	^ builder pluggableTreeSpec new
		model: self;
		roots: #commitList;
		nodeClass: SquotCommitWrapper;
		getSelected: #activeCommit;
		setSelected: #activeCommit:;
		columns: {
			[:listMorph | (listMorph filteredItems collect: [:item |
					item preferredWidthOfColumn: 1]) max].
			[:listMorph | (listMorph filteredItems collect: [:item |
					item preferredWidthOfColumn: 2]) max].
			nil.
		};
		menu: #commitListMenu:;
		yourself