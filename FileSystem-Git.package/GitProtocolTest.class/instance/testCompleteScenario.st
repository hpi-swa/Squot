tests
testCompleteScenario
	| protocol reader writer branch contents |
	
	protocol := self newProtocol.
	branch := protocol branches anyOne.
	protocol openConnection.
	writer := protocol writer.
	reader := protocol reader.
	writer sendWantAll: (Array with: branch) capabilities: GitProtocolCapabilities multiAck thinPack sideBand shallowLines: nil depth: nil.
	writer flushPacket.
	contents := protocol stream contents.
	contents inspect.
	protocol closeConnection.
