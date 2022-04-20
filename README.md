# GitHub Action - Setup-AL
This action is used to setup a Business Central build environment based on the AL Language compiler. 

This GitHub Action will:
  1. Download the AL-Language vsix extension for Visual Studio Code
  2. Setup the environment variable PATH to alc.exe in the .NET 5 version in bin\win32
 

# Getting started

Add the following action to your workflow and use alc.exe through your workflow job. The action takes a single parameter version, specifying the desired version to install. See https://marketplace.visualstudio.com/items?itemName=ms-dynamics-smb.al for version history

```yaml
- name: Setup AL compiler
  uses: segesdk/setup-al@main
  with:
    version: 9.0.605172
```
*Note: best practice is to always review the code for latest commit and only reference the action with a SHA and not a version. This ensures that the contributors cannot alter the code running in your pipelines. E.g.*
```uses: segesdk/setup-al@af23c814804b5b79c22033f94d8949169ccf6ea5```
 

# Status
This is currently in pre-production and being testet. Not the action is only usable on a windows build runner at the moment. Not also that currently the vsix extension package is download form the Visual Studio Marketplace, which enforce a rather aggressive rate policy. This means that the action can only be invoke a certain number of times a minute. Issue regarding this -> https://github.com/microsoft/AL/issues/7003#issuecomment-1103631650
