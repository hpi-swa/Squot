I record the changes between two Metaobjects.

Instance Variables
	changedInstVars:		<Dictionary from Symbol to SquotDiffContent>
	changedVariablePart:		<Dictionary from Integer to SquotDiffContent>

changedInstVars
	Comparing two Metaobjects, the diff content for each changed instance variable goes here.

changedVariablePart
	Comparing two Metaobjects with variable parts, the diff content for each changed element goes here, with the changed index as the key.
	In some cases it might be more desirable to diff such sequences like text, rather like the instance variables...
