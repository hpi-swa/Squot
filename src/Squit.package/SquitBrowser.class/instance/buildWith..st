toolbuilder
buildWith: builder
	^ builder build: (builder pluggableWindowSpec new
		model: self;
		label: #labelString;
		children: {
			self buildButtonBar: builder.
			self buildProjectBranchPanel: builder.
			self buildCommitSearchPanel: builder.
			self buildSummary: builder.
			self buildObjectList: builder})