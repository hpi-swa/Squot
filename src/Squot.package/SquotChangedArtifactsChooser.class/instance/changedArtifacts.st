ui
changedArtifacts
	^ list collect: [:eachAssociation | {eachAssociation value. self originalOf: eachAssociation value}]