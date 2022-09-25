merging
templateMergeWith: incomingTrackedObjectMetadata basedOn: baseTrackedObjectMetadata
	| walk diffs conflicts pathToArtifactId mirrors |
	diffs := OrderedDictionary new.
	conflicts := OrderedDictionary new.
	mirrors := IdentityDictionary new.
	mirrors at: self put: self class squotMirror;
		at: incomingTrackedObjectMetadata put: incomingTrackedObjectMetadata class squotMirror;
		at: baseTrackedObjectMetadata put: baseTrackedObjectMetadata class squotMirror.
	walk := SquotGraphWalk startingFrom: {self. baseTrackedObjectMetadata. incomingTrackedObjectMetadata}.
	"Make sure that it is noticed if the root object is visited twice."
	walk checkPathsTo: self ifMultiple: [self error: 'Multiple paths']. "Irrelevant for metadata merges" "Irrelevant for project merges."
	"Normal graph merges would create an object merge for the root object here. Duplicate behavior with inner loops when comparing common references (the checkPathsTo: root above as well)." "Done only at the end for metadata merges because references back are not supported." "Done only at the end for project merges because references back to the project from the artifacts and metadata are not supported."
	"Normal graph merges would need to consider that the root object is replaced, or the root reference gets a different target." "This is irrelevant for metadata merges, since the whole dictionary tree is treated as a value object structure." "Irrelevant in project merges because projects, artifacts and metadata are treated as values."
	pathToArtifactId := {SquotDictionaryEntry key: #id}. "Ignore all differences in the artifact id."
	walk doNotTrackReferrers.
	walk do:
		[:eachTuple | | working incoming base workingReflected incomingReflected baseReflected path nextInIncoming nextInWorking nextInBase |
		working := eachTuple first.
		base := eachTuple second.
		incoming := eachTuple third.
		incomingReflected := SquotObjectReflection object: incoming mirror: (mirrors at: incoming).
		base ifNil: [working ifNotNil: [self error: 'Different metadata trees must not share object instances']].
		baseReflected := SquotObjectReflection object: base mirror: (base ifNotNil: [mirrors at: base] ifNil: [SquotSystemSingletonMirror class: nil class]).
		working
			ifNil: "Added object"
				[self flag: #todo. "Do the same as if it were present without references (e. g. use nil), except that we do not add reference additions or conflicts because there is no object to patch in the working copy." "Irrelevant for metadata because it must not have multiple references to the same object. Adding the reference with the complete object from the incoming graph is therefore enough." "Irrelevant for project merges because metadata and artifact data are a tree. Only becomes relevant for the graphs inside of each artifact, but they should be merged separately."]
			ifNotNil:
				["Possible optimization: guard against working = incoming. Graphs may share elements if nothing has changed in a component of the graph. Duplicate with possible optimization when comparing targets of common references." "Not required for metadata, which is supposed to be a small structure." "Not required for projects, which are not supposed to have many artifacts or much metadata."
				"Normal graph merges should initialize an object merge now." "Done only at the end in metadata merges because references back are not supported." "Done only at the end in project merges because references back are not supported."
				workingReflected := SquotObjectReflection object: working mirror: (mirrors at: working).
				"If the initiation of the walk does not already handle the possibility that the root object was exchanged, we would need to check here whether the working and incoming object are at all comparable." "Irrelevant for metadata, which always has SquotTrackedObjectMetadata as root and all of these roots are treated as being instances of the same object." "Irrelevant for projects because different projects are not supposed to be merged anyway. If they are, they become the same project by doing that."
				"For project merges, the scope (whole project or single artifact) of the following iterations can be controlled from the outside!"
				(workingReflected references intersection: incomingReflected references) do:
					[:each | | workingReferent baseReferent |
					path := walk currentPath copyWith: each.
					path = pathToArtifactId ifTrue: [self halt].
					nextInIncoming := SquotObjectReflection object: (incomingReflected reflect: each) mirror: (incomingReflected nextMirror: each).
					mirrors at: nextInIncoming object put: nextInIncoming mirror.
					nextInWorking := nextInIncoming mirror instanceOf: nextInIncoming object from: incomingTrackedObjectMetadata path: path in: self ifAbsent: [].
					nextInBase := nextInIncoming mirror instanceOf: nextInIncoming object from: incomingTrackedObjectMetadata path: path in: baseTrackedObjectMetadata ifAbsent: [].
					workingReferent := SquotObjectReflection object: (workingReflected reflect: each) mirror: (workingReflected nextMirror: each).
					mirrors at: workingReferent object put: workingReferent mirror.
					"SquotDiffBuilder does not look up nextInWorking yet. It uses workingReferent object."
					(baseReflected references includes: each)
						ifTrue: 
							[baseReferent := SquotObjectReflection object: (baseReflected reflect: each) mirror: (baseReflected nextMirror: each).
							mirrors at: baseReferent object put: baseReferent mirror.
							nextInWorking = workingReferent object "Normal graph merge compares the identities here." "SquotDiffBuilder compares identities of workingReferent object and nextInIncoming instead, but nextInIncoming and nextInWorking have the same identity (if any at all)." "Irrelevant for project merges because artifacts are values, always true (well except for artifact path consolidation?)."
								ifTrue: "Reference target is the same instance"
									["No need to update the reference then"
									| alreadyVisited |
									mirrors at: nextInWorking put: workingReferent mirror.
									baseReferent object = nextInBase
										ifTrue: [mirrors at: nextInBase put: baseReferent mirror].
									alreadyVisited := false.
									walk checkPathsTo: workingReferent object ifMultiple: [alreadyVisited := true].
									alreadyVisited
										ifTrue: ["Add deep difference hints if the workingReferent object is already known to have any differences." "Irrelevant for metadata which must not have multiple references to the same object:" self error: 'Multiple paths'. "Irrelevant for project merges because artifact data are trees."]
										ifFalse: ["SquotDiffBuilder enqueues instances in the walk if the values (nextInIncoming, workingReferent object) are not equal. It also creates a new object merge for the next instances here." "Irrelevant for metadata because it does not distinguish between identity and equality." "Project merges spawn artifact merging here."]]
								ifFalse: "Reference target is a different object"
									["Possible optimization: guard against workingReferent object being equal to nextInIncoming. Graphs may share elements if nothing has changed in a component of the graph." "Not required for metadata, which is supposed to be a small structure."
									baseReferent object = nextInBase
										ifTrue: "Was changed only in working copy"
											["Keep changed target"
											mirrors at: nextInBase put: baseReferent mirror.
											self flag: #todo. "What if there are deep differences between nextInBase and nextInWorking?" "Irrelevant for metadata."]
										ifFalse:
											[(workingReferent mirror instanceOf: workingReferent object from: self path: path in: baseTrackedObjectMetadata ifAbsent: []) = baseReferent object
												ifTrue: "Was changed only in incoming"
													[diffs at: path put:
														(SquotReferenceTargetExchange reference: each
															leftOwner: working target: workingReferent object
															rightOwner: incoming target: nextInIncoming object)]
												ifFalse: "Was changed in both"
													[conflicts at: path put:
														(SquotObjectReferenceConflict key: each
															base: baseReferent object working: workingReferent object incoming: nextInIncoming object)].
											"Normal graph merges would add the diff or conflict to the object merge instead."
											self flag: #todo. "Consider whether workingReferent must be removed when applying this merge."]]]
						ifFalse: "Reference was added in both versions"
							["Would have to go into detail with the differences here and each of difference would be a conflict."
							nextInWorking = workingReferent object "Normal graph merge compares the identities here." "SquotDiffBuilder compares identities of workingReferent object and nextInIncoming instead, but nextInIncoming and nextInWorking have the same identity (if any at all)." "Irrelevant for project merges because artifacts are values, always true (well except for artifact path consolidation?)."
								ifTrue: "Both introduced a reference to the same object."
									["No need to update the reference."
									| alreadyVisited |
									mirrors at: nextInWorking put: workingReferent mirror.
									alreadyVisited := false.
									walk checkPathsTo: workingReferent object ifMultiple: [alreadyVisited := true].
									alreadyVisited
										ifTrue: ["Add deep difference hints if the workingReferent object is already known to have any differences." "Irrelevant for metadata which must not have multiple references to the same object:" self error: 'Multiple paths']
										ifFalse: ["SquotDiffBuilder enqueues referents in the walk if the values (nextInIncoming, workingReferent object) are not equal. It also creates a new object merge for the next instances here." "Irrelevant for metadata because it does not distinguish between identity and equality." "Project merges spawn artifact merging here."]]
								ifFalse:
									["Possible optimization: guard against workingReferent object being equal to nextInIncoming. Graphs may share elements if nothing has changed in a component of the graph." "Not required for metadata, which is supposed to be a small structure."
									conflicts
										at: path
										put: (SquotReferenceAdditionConflict reference: each
												working: workingReferent object
												owner: working
												incoming: nextInIncoming object
												owner: incoming)]].
					"SquotDiffBuilder detects if nextInWorking does not exist and enqueues nextInIncoming as added object here if it was not already visited. Records that the object will be added to the graph in that case. Duplication with the case when an added reference referent was not visited yet." "Irrelevant for metadata because new objects appear as added references only. Objects at the same path are assumed to have the same identity." "Irrelevant for project merges because like for metadata adding an artifact as a value is enough."
					"If workingReferent object is not already known to have any differences, SquotDiffBuilder remembers referrer working -> workingReferent object and incoming -> nextInIncoming here, so that it can add deep difference hints later if necessary." "Irrelevant for metadata." "Irrelevant for project merges."
					"SquotDiffBuilder only enqueues the referents in the walk if workingReferent object does not exist or if it has the same identity as nextInIncoming (always the case for metadata and projects), and in both cases if the existing referent was not visited yet (always the case for metadata and projects)."
					"Even if this reference is not modified, check for modifications in the referenced objects.".
					self flag: #todo. "Must look up mirrors of nextWorking and nextBase elsewhere."
					nextInWorking ifNotNil: [mirrors at: nextInWorking ifAbsentPut: [self halt "SquotGraphComparisonWalk cheats by using the mirror of nextInIncoming. That usually works because as noted above it only enqueues if workingReferent object and nextInIncoming have the same identity, and should therefore have the same class."]].
					nextInBase ifNotNil: [mirrors at: nextInBase ifAbsentPut: [self halt]].
					nextInWorking ~~ nextInIncoming object "SquotDiffBuilder does this check in other places as noted as possible optimizations above." "Project merges do not walk into the artifact graphs or metadata."
						ifTrue: [walk add: {nextInWorking. nextInBase. nextInIncoming object} reachedVia: each]].
				(workingReflected references copyWithoutAll: incomingReflected references) do:
					[:each | | baseReferent |
					path := walk currentPath copyWith: each.
					path = pathToArtifactId ifTrue: [self halt].
					nextInWorking := SquotObjectReflection object: (workingReflected reflect: each) mirror: (workingReflected nextMirror: each).
					mirrors at: nextInWorking object put: nextInWorking mirror.
					nextInIncoming := nextInWorking mirror instanceOf: nextInWorking object from: self path: path in: incomingTrackedObjectMetadata ifAbsent: [].
					nextInBase := nextInWorking mirror instanceOf: nextInWorking object from: self path: path in: baseTrackedObjectMetadata ifAbsent: [].
					(baseReflected references includes: each)
						ifFalse: ["Leave reference added"
								"If the incoming graph has any differences in the referent, the graph will have a reference to it elsewhere. The differences will be detected at the other reference. If it is not referenced anywhere else, the incoming graph cannot introduce any changes to it." "For metadata, the referent cannot be referenced from anywhere else." "For projects the project cannot be referenced from anywhere else."]
						ifTrue: "Incoming version has the reference removed"
							[baseReferent := SquotObjectReflection object: (baseReflected reflect: each) mirror: (baseReflected nextMirror: each).
							nextInBase = baseReferent object "Normal graph merges would probably compare the identities." "Project merges actually compare the artifact metadata and graphs."
								ifTrue: "Working copy did not change the reference, so remove it"
									[diffs
										at: path
										put: (SquotReferenceRemoval
												of: nextInWorking object
												from: working
												reference: each
												rightObject: incoming).
									self flag: #todo. "What if there are deep differences between nextInBase and nextInWorking?" "Irrelevant for metadata" "Handled in the comparison above for projects."]
								ifFalse: "Working copy changed the reference"
									[conflicts
										at: path
										put: (SquotObjectReferenceConflict key: each
												base: baseReferent object
												working: nextInWorking object
												incoming: nil)]
							"Normal graph merges would add the removal or conflict to the object merge instead."].
					"Do not enqueue the removed referent in the walk. If the removed object has any differences in the incoming graph, the graph will have a reference to it elsewhere. The differences will be detected at the other reference. If it is not referenced anywhere else it will be removed from the graph and needs not be further investigated (unless we need to enumerate all objects to be removed, which may be behind nextInWorking). The incoming graph cannot introduce any changes to it then." "For metadata, the removed object cannot be referenced anywhere else."].
				(incomingReflected references copyWithoutAll: workingReflected references) do:
					[:each | | baseReferent alreadyVisited |
					path := walk currentPath copyWith: each.
					path = pathToArtifactId ifTrue: [self halt].
					nextInIncoming := SquotObjectReflection object: (incomingReflected reflect: each) mirror: (incomingReflected nextMirror: each).
					mirrors at: nextInIncoming object put: nextInIncoming mirror.
					nextInWorking := nextInIncoming mirror instanceOf: nextInIncoming object from: incomingTrackedObjectMetadata path: path in: self ifAbsent: [].
					nextInBase := nextInIncoming mirror instanceOf: nextInIncoming object from: incomingTrackedObjectMetadata path: path in: baseTrackedObjectMetadata ifAbsent: [].
					(baseReflected references includes: each)
						ifFalse: [diffs at: path put: (SquotReferenceAddition to: working reference: each target: nextInIncoming object rightOwner: incoming) "Normal graph merges would add the addition to the object merge instead."]
						ifTrue: "Working copy has the reference removed"
							[baseReferent := SquotObjectReflection object: (baseReflected reflect: each) mirror: (baseReflected nextMirror: each).
							nextInBase = baseReferent object "Normal graph merges would probably compare the identities." "Project merges actually compare the artifact metadata and graphs."
								ifTrue: "Reference not changed in incoming version."
									["Leave it removed"
									self flag: #todo. "What if there are deep differences between nextInBase and nextInWorking?" "Irrelevant for metadata"]
								ifFalse: "Reference was changed to a different object"
									[conflicts
										at: path
										put: (SquotObjectReferenceConflict
												key: each
												base: baseReferent object
												working: nil
												incoming: nextInIncoming object)]].
					alreadyVisited := false.
					walk checkPathsTo: nextInIncoming object ifMultiple: [alreadyVisited := true].
					alreadyVisited
						ifTrue: ["Do not enqueue in the walk" "Irrelevant for metadata, which must not have multiple references to the same object." self error: 'Multiple paths'. "Irrelevant for projects because artifact data are trees."]
						ifFalse:
							["SquotDiffBuilder detects if nextInWorking does not exist and enqueues nextInIncoming as added object here. Records that the object will be added to the graph." "Irrelevant for metadata because new objects appear as added references only. Objects at the same path are assumed to have the same identity." "Irrelevant for project merges because like for metadata adding an artifact as a value is enough."
							"Possible optimization: guard against nextInWorking being equal to nextInIncoming. Graphs may share elements if nothing has changed in a component of the graph." "Not required for metadata, which is supposed to be a small structure."
							"SquotDiffBuilder enqueues referents in the walk if the values (nextInIncoming, nextInWorking) are not equal. It also creates a new object merge for the next instances here." "Irrelevant for metadata because it does not distinguish between identity and equality."
							nextInWorking ifNotNil: [mirrors at: nextInWorking ifAbsentPut: [self halt "SquotGraphComparisonWalk cheats by using the mirror of nextInIncoming. That usually works because nextInWorking and nextInIncoming have the same identity, and should therefore have the same class."]].
							nextInBase ifNotNil: [mirrors at: nextInBase ifAbsentPut: [self halt]].
							nextInWorking ~~ nextInIncoming object "SquotDiffBuilder does this check in other places as noted as possible optimizations above." "Project merges do not walk into the artifact graphs or metadata."
								ifTrue: [walk add: {nextInWorking. nextInBase. nextInIncoming object} reachedVia: each]]]]].
	"Project merges additionally initialize the load order merge here."
	^ SquotTrackedObjectMetadataMerge into: self merge: incomingTrackedObjectMetadata basedOn: baseTrackedObjectMetadata diffs: diffs conflicts: conflicts