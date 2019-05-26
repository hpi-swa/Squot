testing
testPrefixed
	self assert: ((packedRefs prefixedWith: 'refs/heads/') includesAllOf:
		{GitReference name: 'refs/heads/master' target: '690a2897d38d45ae78966e449fce306b8a7fa7a8'.
		GitReference name: 'refs/heads/develop' target: '2527927a810b75ea3c6dfb7501fbb2b148e16d7d'}).
	
	self assert: ((packedRefs prefixedWith: 'refs/tags/') includesAllOf:
		{GitReference name: 'refs/tags/v0.1.0' target: '246a313f7b45917bb0a819b3d368b4b9f433cde5'.
		GitReference name: 'refs/tags/v0.2.0' target: '609bef0e63a4448c34acc5ca8038fc1205766ecd'.
		GitReference name: 'refs/tags/v2.8.5' target: '642ae46e40676dac8d34cdcaf9273127f831e606'}).