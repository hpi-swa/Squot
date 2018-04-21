as yet unclassified
buildPackageList: builder for: aListSelector index: anIndexSelector frame: aRectangle

	^ builder pluggableListSpec new
		model: self;
		filterableList: true;
		clearFilterAutomatically: false;
		autoDeselect: true;
		list: aListSelector;
		getIndex: anIndexSelector;
		setIndex: anIndexSelector asMutator;
		frame: aRectangle