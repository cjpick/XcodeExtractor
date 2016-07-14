

# XcodeExtractor

XcodeExtractor is a tool for automatically generating file for use within an xcode project. The tool is designed to run during the build phase and recreate files to keep them fully up to date. At this time the only functioning part is for generating an enum for segues as well as a helper protocol.

## Installation

-Build the project
-Copy the built tool into /usr/local/bin


## Usage

Open up the Build Phases
Add a New Run Script Phase
Move the New Run Script Phase to under Target Dependencies
In the script line type "XcodeExtractor -s -d (the location to your projects sources directory)"

