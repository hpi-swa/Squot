tests
testHistorianIsHead
	| master |
	master := squitRepository historianNamed: 'master'.
	self assert: master isHead.
	squitRepository gitRepository repository updateHeadToBranch: 'develop'.
	self deny: master isHead.