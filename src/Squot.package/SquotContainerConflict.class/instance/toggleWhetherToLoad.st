accessing
toggleWhetherToLoad
	working isRemoval not ifTrue: [working toggleWhetherToLoad].
	incoming isRemoval not ifTrue: [incoming toggleWhetherToLoad].
	resolution ifNotNil: [resolution isRemoval not ifTrue: [resolution toggleWhetherToLoad]].