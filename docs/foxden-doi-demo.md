# DOI demo
Here we provide basic shell script demonstrating FOXDEN DOI publication
steps:
```
#!/bin/bash

# create write token
token=`foxden token create write | head -1`
export CHESS_WRITE_TOKEN=$token

# create read token
echo "foxden token create read"
token=`foxden token create read | head -1`
export CHESS_TOKEN=$token

# view issued tokens
foxden token view

# create new DOI document
foxden doi create

# the output would be something like this:
# Document is created: id=10838904 URL=https://zenodo.org/deposit/10838904
# and you need to grab the document id for further interactions, i.e. in this
# case it is 10838904

# get details of document id
foxden doi view 10838904

# add file to document id: test/data/test-data.json
foxden doi add 10838904 test/data/test-data.json

# add as many files as you like using previous commands and changing the last argument with your file

# get details of document id
foxden doi view 10838904

# list existing documents
foxden doi ls 10838904

# update doi document with our meta-data test/data/doi.json file
# please change your meta-data according to your use-case
# please note the files list is empty but you may add to it any other files in the following form
# {"name": "vimrc", "file": "/Users/vk/.vimrc"}
# so the list accept a dictionary records where name which will appear in zenodo
# and file is an actual file which will be used from your file system
cat test/data/doi.json
{
    "files": [],
    "metadata": {
        "publication_type": "article",
        "upload_type":"publication",
        "description":"Test FOXDEN publication",
        "keywords": ["bla", "foo"],
        "creators": [{"name": "First Last", "affiliation": "Zenodo"}],
        "title":"Test experiment"
    }
}
# and now run update command with it
foxden doi update 10838904 test/data/doi.json

# publish document id
foxden doi publish 10838904

# list existing documents
foxden doi ls 10838904

# it will provide the following output:
# DOI https://doi.org/10.5281/zenodo.10838904
# Zenodo: https://zenodo.org/records/10838904
```
