tests
testAddNewObjectsFromArtifact
	"When a previously unloaded object is added from a snapshot,
	it should be materialized and get the same name as in the snapshot."
	| artifact materialized object path |
	object := StringHolder new contents: 'test'.
	path := 'test.obj'.
	artifact := (SquotImageStore new add: object at: path; artifactAt: path) capture.
	self assert: artifact shadowOfTrackedObject hasSquotShadowName.
	imageStore add: artifact.
	[materialized := imageStore objectAt: path]
		on: NotFound do: [:e | self fail: 'object was not added'].
	self assert: (materialized isKindOf: StringHolder).
	self assert: 'test' equals: materialized contents.
	self assert: materialized ~~ object.
	self assert: (imageStore objectRegistry nameOf: materialized) = artifact shadowOfTrackedObject name.