private
followReferences
	walk do: [:each | | object mirror |
		object := each key. mirror := each value.
		self capture: object reflectedIn: mirror].