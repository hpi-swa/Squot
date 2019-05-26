testing
testDelete
	self assert: (packedRefs includesRef: 'refs/heads/develop').
	packedRefs delete: 'refs/heads/develop'.
	self deny: (packedRefs includesRef: 'refs/heads/develop').
	self assert: (packedRefs refs includesAllOf:
		{GitReference name: 'refs/heads/master' target: '690a2897d38d45ae78966e449fce306b8a7fa7a8'.
		GitReference name: 'refs/tags/v0.1.0' target: '246a313f7b45917bb0a819b3d368b4b9f433cde5'.
		GitReference name: 'refs/tags/v0.2.0' target: '609bef0e63a4448c34acc5ca8038fc1205766ecd'}).
	self assert: (self packedRefsTestContents lines
					reject: [:each | (each endsWith: 'refs/heads/develop')
									or: [each beginsWith: '^']])
		equals: (packedRefs file readStreamDo: [:s | s text; contents]) lines.