toolbuilder
buildWith: builder
	^ builder build: (builder pluggableWindowSpec new
		model: self;
		label: #labelString;
		children: {
			self buildButtonBar: builder.
			self buildProjectList: builder.
			self buildBranchList: builder.
			self buildCommitList: builder.
			self buildSummary: builder.
			self buildObjectList: builder})