toolbuilder
buildCommitInfo: builder
	^ builder pluggableTextSpec new
		model: self;
		getText: #activeCommitInfo;
		readOnly: true;
		frame: LayoutFrame fullFrame;
		yourself.