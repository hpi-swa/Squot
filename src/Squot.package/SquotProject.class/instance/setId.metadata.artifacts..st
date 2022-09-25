initialize-release
setId: projectId metadata: aDictionary artifacts: aCollection
	id := projectId.
	metadata := aDictionary veryDeepCopy.
	artifacts := aCollection as: OrderedDictionary.