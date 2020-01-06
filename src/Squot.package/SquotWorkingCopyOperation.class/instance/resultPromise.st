*Squot-Tools accessing
resultPromise
	^ extensions at: #resultPromise ifAbsentPut: [Promise new]