toolbuilder
buildTodoList: builder
	^ builder pluggableTreeSpec new
		model: self;
		roots: #todoList;
		nodeClass: SquotRebaseOperationWrapper;
		getSelected: #activeOperation;
		setSelected: #activeOperation:;
		columns: {
			[:listMorph | (listMorph filteredItems collect: [:item |
					item preferredWidthOfColumn: 1]) max].
			[:listMorph | (listMorph filteredItems collect: [:item |
					item preferredWidthOfColumn: 2]) max].
			nil.
		};
		yourself