tests
testMergeMessage
	| remoteTrackingHistorian message |
	remoteTrackingHistorian := self trackingBranchForRemote: 'myremote' branch: 'mybranch' hash: self master version hexHash.
	message := remoteTrackingHistorian messageWhenMergingInto: self master.
	self assert: message = 'Merge branch ''mybranch'' of myremote into master'.