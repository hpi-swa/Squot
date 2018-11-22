accessing
shadows

	^ (self trackedFiles collect: [:each | each -> (LBGitDeserializedShadow onReference: (self rootDirectory resolve: each))]) asDictionary 