private receiving
readLines: aBlock
	self isThisEverCalled.
	
	self readLinesUpTo: '0000' do: aBlock