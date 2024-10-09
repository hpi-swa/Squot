toolbuilder
buildOperations: builder
	^ builder pluggableTreeSpec new
		model: self;
		roots: #operationsWithHeader;
		nodeClass: GSRebaseOperationWrapper;
		getSelected: #activeOperation;
		setSelected: #activeOperation:;
		dragItem: #dragItem:;
		dropAccept: #wantsDropItem:;
		dropItem: #dropItem:on:;
		menu: #operationMenu:;
		columns: {
			[:listMorph | ((listMorph filteredItems
							reject: [:item | item complexContents operation isHeader])
							collect: [:item | item preferredWidthOfColumn: 1])
							max].
			nil
		};
		yourself