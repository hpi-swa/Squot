converting
asMonticelloPatch
	^ MCPatch operations: (self left asMonticelloPatch operations collect: [:each | each inverse])