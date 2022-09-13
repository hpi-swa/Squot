private
updateHistorianDecorationsMap
	historiansForDecoration :=
		(self projectSelection repository historians, self projectSelection repository remoteHistorians
			groupBy: [:each | each version]).