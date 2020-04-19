accessing
evictFromObjectCache
	<preference: 'Evict from object cache'
		categoryList: #('Git expert settings')
		description: ''
		type: #Boolean>
	^ EvictFromObjectCache ifNil: [false]