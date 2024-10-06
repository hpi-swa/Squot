toolbuilder
buildCommitInfo: builder
	^ builder pluggableTextSpec new
		model: self;
		getText: #activeCommitInfo;
		readOnly: true;
		yourself