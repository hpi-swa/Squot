tests
testMetadataConflict
	| path acceptReturned metadataNode fooNode contestedNode result |
	path := 'conflicted-artifact'.
	self openToolAndTestOn: (self mergeWithMetadataConflictAt: path).
	self assert: (metadataNode := tool rootNodes first children detect: [:each | each title asString includesSubstring: 'Metadata' translated] ifNone: []) notNil.
	"When the choices are reset, each conflict needs to be resolved."
	(metadataNode withAllChildren select: [:each | each offersChoice]) do: [:each | each resetChoice].
	self assert: (fooNode := metadataNode children detect: [:each | each title asString includesSubstring: 'foo']) needsChoice.
	tool selectNode: fooNode;
		activateSelectedNode. "choose incoming edition"
	self assert: (contestedNode := metadataNode children detect: [:each | each title asString includesSubstring: 'contested']) needsChoice.
	tool selectNode: contestedNode;
		deactivateSelectedNode. "choose working copy edition"
	"The nodes for modifications, additions, removals do not need to be resolved.
	Exclude them all to test later whether what is selected makes a difference."
	#('old' 'update' 'new') do:
		[:each | | node |
		self deny: (node := metadataNode children detect: [:eachNode | eachNode title asString includesSubstring: each]) needsChoice.
		tool selectNode: node;
			deactivateSelectedNode].
	"Since we resolved the conflicts, the merge can be accepted."
	self closeDialogPossiblyOpenedDuring: [tool accept. acceptReturned := true]
		timeoutMsecs: 5.
	self assert: acceptReturned == true.
	"When the merge is applied, the metadata is updated as selected in the tool."
	result := (tool selectedPatch "actually the merge" resolvedPatch
		applyTo:
			(SquotSnapshot builder
				add:
					(SquotArtifact new path: path;
						storeInfo:
							(SquotTrackedObjectMetadata newFrom: {#foo -> 'bar'. #contested -> 'working'. #old -> ''. #update -> 'original'});
						content: SquotArtifactContentMock new);
				yourself))
		artifactAt: path.
	self assert: 'bla' equals: (result storeInfo at: #foo);
		assert: 'working' equals: (result storeInfo at: #contested);
		deny: (result storeInfo includesKey: #new);
		assert: (result storeInfo includesKey: #old);
		assert: 'original' equals: (result storeInfo at: #update).