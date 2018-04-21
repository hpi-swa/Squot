as yet unclassified
buildWith: builder

	| dialog |
	dialog := builder build: (builder pluggableDialogSpec new
		model: self;
		closeAction: #closed;
		extent: self initialExtent;
		autoCancel: true;
		title: 'Start or stop tracking packages';
		children: {
			self buildPackageList: builder for: #untrackedPackages index: #selectionUntracked frame: (0 @ 0 corner: 0.4 @ 1).
			self buildButtons: builder.
			self buildPackageList: builder for: #trackedPackages index: #selectionTracked frame: (0.6 @ 0 corner: 1 @ 1)};
		buttons: {
			builder pluggableButtonSpec new
				model: self; 
				label: 'Accept';
				action: #accept}).
	
	dialog addKeyboardCaptureFilter: self.
	^ dialog