as yet unclassified
content

	self flag: #DEPRECATED.
	^ content ifNil: 
		[self collectTrackedFiles. 
		self content: (SquotShadowGraph withSingleShadow: (LBGitFileListShadow on: self)).
		content]