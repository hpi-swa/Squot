accessing
artifacts

	^ (self loadOrder with: self artifactsInLoadOrder collect: [:path :artifact | path -> artifact]) asDictionary