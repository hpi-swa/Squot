tests
testMergeMessage
	| remoteTrackingHistorian message |
	remoteTrackingHistorian := squitRepository historianNamed: 'mybranch'.
	message := remoteTrackingHistorian messageWhenMergingInto: self master.
	self assert: message = 'Merge branch ''mybranch'' into master'.