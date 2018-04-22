toolbuilder
buildWith: builder

	^ (builder build: (builder pluggableDialogSpec new
		model: self;
		extent: self initialExtent;
		autoCancel: true;
		title: 'Start or stop tracking packages';
		children: {
			self buildUntrackedList: builder.
			self buildButtons: builder.
			self buildTrackedList: builder};
		buttons: {
			builder pluggableButtonSpec new
				model: self;
				label: 'Accept';
				action: #accept}))
		addKeyboardCaptureFilter: self;
		yourself