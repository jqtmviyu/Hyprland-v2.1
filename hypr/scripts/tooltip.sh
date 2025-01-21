#!/bin/bash
read -r -d '' data << EOF
{
"text": "",
"tooltip": "$1",
"class": ""
}
EOF
echo $data
