toolbuilder
buildUntrackedList: builder

	^ builder pluggableListSpec new
		model: self;
		filterableList: true;
		clearFilterAutomatically: false;
		autoDeselect: true;
		list: #untrackedPackagesWithTitle;
		getIndex: #selectionUntracked;
		setIndex: #selectionUntracked:;
		frame: (LayoutFrame fractions: (0 @ 0 corner: 0.5 @ 1) offsets: (0 @ 0 corner: self buttonWidth / -2 @ 0))