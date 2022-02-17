tests
testPatchingPreservesId
	| object changed diff originalId |
	object := Object new.
	imageStore add: object at: 'example'.
	originalId := (imageStore artifactAt: 'example') id.
	changed := (imageStore artifactAt: 'example') snapshot copy.
	changed id: UUID new.
	changed storeInfo at: #dummy put: 2.
	"when"
	diff := (imageStore artifactAt: 'example') diffAgainst: changed.
	imageStore applyDiff: diff toObjectAt: 'example'.
	"then"
	self assert: originalId equals: (imageStore artifactAt: 'example') id.