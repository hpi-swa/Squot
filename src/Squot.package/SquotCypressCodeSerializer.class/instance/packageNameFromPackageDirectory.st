private
packageNameFromPackageDirectory
    | filename |
    filename := fileUtils directoryName: self directory.
    ^ filename copyFrom: 1 to: (filename lastIndexOf: $.) - 1