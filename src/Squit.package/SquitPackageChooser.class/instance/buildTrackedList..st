toolbuilder
buildTrackedList: builder

	^ builder pluggableMultiSelectionListSpec new
		model: self;
		filterableList: true;
		clearFilterAutomatically: false;
		autoDeselect: true;
		list: #trackedPackagesWithTitle;
		getIndex: #selectionTracked;
		setIndex: #selectionTracked:;
		getSelectionList: #selectionsTrackedAt:;
		setSelectionList: #selectionsTrackedAt:put:;
		frame: (LayoutFrame fractions: (0.5 @ 0 corner: 1 @ 1) offsets: (self buttonWidth / 2 @ 0 corner: 0 @ 0));
		yourself