toolbuilder
buildWith: builder

	| dialog |
	dialog := builder build: (builder pluggableDialogSpec new
		model: self;
		extent: self initialExtent;
		autoCancel: true;
		title: 'Start or stop tracking packages';
		children: {
			self buildPackageList: builder for: #untrackedPackages index: #selectionUntracked frame: (LayoutFrame fractions: (0 @ 0 corner: 0.5 @ 1) offsets: (0 @ 0 corner: self buttonWidth / -2 @ 0)).
			self buildButtons: builder.
			self buildPackageList: builder for: #trackedPackages index: #selectionTracked frame: (LayoutFrame fractions: (0.5 @ 0 corner: 1 @ 1) offsets: (self buttonWidth / 2 @ 0 corner: 0 @ 0))};
		buttons: {
			builder pluggableButtonSpec new
				model: self; 
				label: 'Accept';
				action: #accept}).
	
	dialog addKeyboardCaptureFilter: self.
	^ dialog