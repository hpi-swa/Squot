merging
mergeSnapshot: incomingMCSnapshot into: workingMCSnapshot
	^ [MCThreeWayMerger 
				base: workingMCSnapshot
				target: incomingMCSnapshot
				ancestor: snapshot]
		on: MCNoChangesException do: [:e | e resume "swallow 'no changes' inform"]