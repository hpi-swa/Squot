comparing
diffsAgainst: aSnapshot
	| otherArtifacts myArtifacts commonArtifacts diffs additions removals |
	myArtifacts := self artifacts.
	otherArtifacts := aSnapshot artifacts.
	commonArtifacts := otherArtifacts keys intersection: myArtifacts keys.
	diffs := commonArtifacts collect: [:path |
		(myArtifacts at: path) diffAgainst: (otherArtifacts at: path)].
	additions := (otherArtifacts keys copyWithoutAll: myArtifacts keys)
		collect: [:path | (otherArtifacts at: path) absentCopy diffAgainst: (otherArtifacts at: path)].
	removals := (myArtifacts keys copyWithoutAll: otherArtifacts keys)
		collect: [:path | (myArtifacts at: path) diffAgainst: (myArtifacts at: path) absentCopy].
	^ diffs, additions, removals