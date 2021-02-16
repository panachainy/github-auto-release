# Manual Install json

# cd ~/bin
# curl -L https://github.com/trentm/json/raw/master/lib/json.js > json
# chmod 755 json

# == general command =======================================================================================================

remove_new_line(){
    _remove_new_line_tmp="`echo $1 | sed ':a;N;$!ba;s/\n//g'`"
}

write_file_from_blob_type(){
    remove_new_line $1
    echo $_remove_new_line_tmp | json content | base64 -d > $2
}

# == tree ==================================================================================================================

_base_url='https://api.github.com/repos/panachainy/github-auto-release/git/trees/develop'
_json_data=`curl -H "Accept: application/vnd.github.v3+json" $_base_url`

# if tree use this
echo $_json_data | json tree | json 0 | json type
echo $_json_data | json tree | json 0 | json path
echo $_json_data | json tree | json 0 | json url

# == content ===============================================================================================================

_have_content=`curl https://api.github.com/repos/panachainy/github-auto-release/git/blobs/eb079ffdc682e0868619fda16817bad33afcbd9e`

write_file_from_blob_type $_have_content "c.txt"
