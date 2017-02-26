utilities
directoryFromPath: directoryPath
    ^ (FSAbsolutePath from: directoryPath delimiter: self pathNameDelimiter) asFileReference