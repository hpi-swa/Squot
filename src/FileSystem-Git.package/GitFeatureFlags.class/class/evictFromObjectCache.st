accessing
evictFromObjectCache
	<preference: 'Evict from object cache'
		categoryList: #('Git expert settings')
		description: 'If false, all objects are kept in the cache indefinitely. If true, there is a size limit for the cache. Each repository has its own cache.'
		type: #Boolean>
	^ EvictFromObjectCache ifNil: [false]