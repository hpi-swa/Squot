enumerating
referencesFrom: aDictionary
	"Account only for the dictionary entries. Ignore all other properties that could distinguish different dictionary classes from each other."
	| references |
	references := OrderedCollection new.
	aDictionary keys do: [:each | references add: (SquotDictionaryEntry key: each)].
	^ references