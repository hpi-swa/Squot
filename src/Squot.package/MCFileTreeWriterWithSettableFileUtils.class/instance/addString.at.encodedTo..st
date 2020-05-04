accessing
addString: string at: fileNameOrPath encodedTo: ignored
    "fileNameOrPath may have one or two elements"
    "encodeTo: arg, because FileTree uses UTF8 by default"

    | fullPath path |
    path := MCFileTreePackageStructureStWriter useCypressWriter
        ifTrue: [ 
            fullPath := self fileUtils
                buildPathFrom:
                    {(MCFileTreeStCypressWriter monticelloMetaDirName).
                    fileNameOrPath}.
            self fileUtils ensureFilePathExists: fullPath relativeTo: self packageFileDirectory.
            fullPath ]
        ifFalse: [ fileNameOrPath ].
    string isEmpty
        ifFalse: [ self fileUtils writeStreamFor: path in: self packageFileDirectory do: [ :file | file nextPutAll: string ] ]
