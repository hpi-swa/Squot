tests
testStartingFromNowhere
	self assert: walk atEnd.
	self tearDown; setUp. "in case atEnd modifies the state"
	walk do: [:x | self fail: 'there should be no versions'].