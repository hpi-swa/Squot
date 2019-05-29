ui menu
remotesMenuWithItems: aBlock
	| remotesMenuSpec |
	remotesMenuSpec := ToolBuilder default pluggableMenuSpec new.
	(self chooseableRemoteNamesFrom: self projectSelection repository gitRepository) sorted do:
		[:each | aBlock value: remotesMenuSpec value: each].
	^ ToolBuilder default buildPluggableMenu: remotesMenuSpec
	