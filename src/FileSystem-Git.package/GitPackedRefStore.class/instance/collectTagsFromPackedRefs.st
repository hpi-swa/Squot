private
collectTagsFromPackedRefs
	| tags |
	tags := Dictionary new.
	(self packedRefs prefixedWith: 'refs/tags/') do: [:each |
		tags
			at: each name
			put: (repository objectNamed: each signature)].
	^ tags