testing
testStartingFromNil
	walker startingFrom: nil do: [:x | self fail: 'there should be no versions'].