toolbuilder
buildRemoteList: builder
	^ builder pluggableListSpec new
		model: self;
		list: #remoteList;
		getSelected: #selectedRemoteName;
		setSelected: #selectedRemoteName:;
		yourself