private accessing
updateLoadOrderFromVersion: aVersion
	SquotToggles useNewApi
		ifTrue:
			[| order |
			self flag: #todo. "Workaround below to fix the situation when ids existing in the version that don't exist in the working copy, or the other way around. Should rather adjust the working copy ids to what has been saved."
			order := OrderedCollection new.
			aVersion snapshot artifacts do:
				[:each | (project artifacts detect: [:eachArtifact | eachArtifact path = each path] ifNone: []) ifNotNil: [:myArtifact | order add: myArtifact id]].
			order addAll: ((project artifacts collect: [:each | each id]) copyWithoutAll: order).
			project reorder: order]
		ifFalse:
			[project reorder: aVersion snapshot artifacts keys]