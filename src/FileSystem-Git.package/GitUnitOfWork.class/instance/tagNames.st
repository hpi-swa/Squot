accessing
tagNames
	| tagNames |
	tagNames := OrderedCollection new.
	refStores do: [:each | tagNames addAll: each tagNames].
	^ tagNames