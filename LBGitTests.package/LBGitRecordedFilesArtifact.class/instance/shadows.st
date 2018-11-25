accessing
shadows

	^ (self trackedFiles keys collect: [:each | each -> (LBGitDeserializedShadow onReference: (self rootDirectory resolve: each))]) asDictionary 