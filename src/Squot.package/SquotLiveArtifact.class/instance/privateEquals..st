comparing
privateEquals: anArray
	"{object. path. storeInfo. store}"
	^ object = (anArray at: 1)
		and: [store = (anArray at: 4)
		and: [path = (anArray at: 2)
		and: [storeInfo = (anArray at: 3)]]]