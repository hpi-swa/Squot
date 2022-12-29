building
compareIncomingArtifact: anArtifact
	| workingArtifact workingArtifactAtPath baseArtifact baseArtifactAtPath artifactMirror |
	self flag: #duplication. "This duplicates the control flow in: " SquotMergeBuilder>>#followAllReferencesOfCurrentInstances.
	workingArtifact := workingProjectSnapshot artifactAt: anArtifact id ifAbsent: [].
	workingArtifactAtPath := workingProjectSnapshot artifacts detect: [:each | each path = anArtifact path] ifNone: [].
	baseArtifact := baseProjectSnapshot artifactAt: anArtifact id ifAbsent: [].
	baseArtifactAtPath := baseProjectSnapshot artifacts detect: [:each | each path = anArtifact path] ifNone: [].
	artifactMirror := SquotArtifactMirror new.
	(workingArtifact notNil & workingArtifactAtPath notNil and: [anArtifact id = workingArtifactAtPath id])
		ifTrue:
			[self reached: (SquotObjectReflection object: workingArtifact mirror: artifactMirror) at: {SquotArtifactReference path: workingArtifact path}.
			self prepareMerge: (SquotObjectReflection object: workingArtifact mirror: artifactMirror)
				with: (SquotObjectReflection object: anArtifact mirror: artifactMirror) 
				basedOn: (SquotObjectReflection object: baseArtifact mirror: (baseArtifact ifNotNil: [artifactMirror] ifNil: [SquotObjectReflection object: nil mirror: nil class squotMirror])) reachedVia: (SquotArtifactReference path: anArtifact path)
				ifSkipping: []]
		ifFalse:
			[workingArtifactAtPath
				ifNotNil:
					[baseArtifactAtPath
						ifNotNil:
							[(baseArtifact notNil and: [anArtifact id = baseArtifactAtPath id])
								ifTrue: "Artifact was replaced in the working copy"
									[self reached: (SquotObjectReflection object: workingArtifactAtPath mirror: artifactMirror) at: {SquotArtifactReference path: anArtifact path}.
									workingArtifact ifNil: [self added: (SquotObjectReflection object: anArtifact mirror: artifactMirror) reachedVia: (SquotArtifactReference path: anArtifact path) ifSkipping: []]]
								ifFalse:
									[(workingArtifactAtPath id = baseArtifactAtPath id)
										ifTrue: "Different artifact only in incoming"
											[self changed: (SquotObjectReflection object: workingArtifactAtPath mirror: artifactMirror) to: (SquotObjectReflection object: anArtifact mirror: artifactMirror) at: {SquotArtifactReference path: anArtifact path}]
										ifFalse: "Different artifacts in all three versions"
											[self conflictingChanged: (SquotObjectReflection object: workingArtifactAtPath mirror: artifactMirror) to: (SquotObjectReflection object: anArtifact mirror: artifactMirror) base: (SquotObjectReflection object: baseArtifactAtPath mirror: artifactMirror) at: {SquotArtifactReference path: anArtifact path}].
									workingArtifact ifNil: [self added: (SquotObjectReflection object: anArtifact mirror: artifactMirror) reachedVia: (SquotArtifactReference path: anArtifact path) ifSkipping: []]]]
						ifNil: "Different artifacts added at the same path"
							[self conflictingAdded: (SquotObjectReflection object: workingArtifactAtPath mirror: artifactMirror)
								and: (SquotObjectReflection object: anArtifact mirror: artifactMirror)
								at: {SquotArtifactReference path: anArtifact path}.
							workingArtifact ifNil: [self added: (SquotObjectReflection object: anArtifact mirror: artifactMirror) reachedVia: (SquotArtifactReference path: anArtifact path) ifSkipping: []]]]
				ifNil: "No artifact at that path in the working copy"
					[baseArtifactAtPath
						ifNotNil: "Working copy has the artifact at that path removed"
							[(baseArtifact notNil and: [anArtifact id = baseArtifactAtPath id])
								ifTrue:
									[self removedFromWorkingCopy: (SquotObjectReflection object: baseArtifact mirror: artifactMirror) at: {SquotArtifactReference path: anArtifact path}.
									workingArtifact ifNil: [self disappeared: (SquotObjectReflection object: anArtifact mirror: artifactMirror) reachedVia: (SquotArtifactReference path: anArtifact path) ifSkipping: []]]
								ifFalse: "Replaced by different artifact in incoming"
									[self conflictingRemovedFromWorkingCopy: (SquotObjectReflection object: baseArtifact mirror: artifactMirror)
										incoming: (SquotObjectReflection object: anArtifact mirror: artifactMirror)
										at: {SquotArtifactReference path: anArtifact path}.
									workingArtifact
										ifNotNil:
											[self prepareMerge: (SquotObjectReflection object: workingArtifact mirror: artifactMirror)
												with: (SquotObjectReflection object: anArtifact mirror: artifactMirror)
												basedOn: (SquotObjectReflection object: baseArtifact mirror: (baseArtifact ifNotNil: [artifactMirror] ifNil: [SquotObjectReflection object: nil mirror: nil class squotMirror]))
												reachedVia: (SquotArtifactReference path: anArtifact path)
												ifSkipping: []]
										ifNil:
											[self added: (SquotObjectReflection object: anArtifact mirror: artifactMirror) reachedVia: (SquotArtifactReference path: anArtifact path) ifSkipping: []]]]
						ifNil: "Incoming added the artifact at that path"
							[self added: (SquotObjectReflection object: anArtifact mirror: artifactMirror) at: {SquotArtifactReference path: anArtifact path}.
							workingArtifact
								ifNotNil:
									[self prepareMerge: (SquotObjectReflection object: workingArtifact mirror: artifactMirror)
										with: (SquotObjectReflection object: anArtifact mirror: artifactMirror)
										basedOn: (SquotObjectReflection object: baseArtifact mirror: (baseArtifact ifNotNil: [artifactMirror] ifNil: [SquotObjectReflection object: nil mirror: nil class squotMirror]))
										reachedVia: (SquotArtifactReference path: anArtifact path)
										ifSkipping: []]
								ifNil:
									[self added: (SquotObjectReflection object: anArtifact mirror: artifactMirror) reachedVia: (SquotArtifactReference path: anArtifact path) ifSkipping: []]]]].