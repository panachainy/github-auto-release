remove_new_line(){
    _remove_new_line_tmp="`echo $1 | sed ':a;N;$!ba;s/\n//g'`"
}

_base_url='https://api.github.com/repos/panachainy/github-auto-release/git/trees/develop'
_json_data=`curl -H "Accept: application/vnd.github.v3+json" $_base_url`

download_file(){
    remove_new_line $1

    _type=`echo $_remove_new_line_tmp | json tree | json 0 | json type`
    _path=`echo $_remove_new_line_tmp | json tree | json 0 | json path`
    _url=`echo $_remove_new_line_tmp | json tree | json 0 | json url`

    echo $_remove_new_line_tmp

    echo $_type
    echo $_path
    echo $_url

    if [[ $_type == "tree" ]]; then
        echo "in if"
    elif [[ $_type == "blob" ]]; then
        echo "in blob"
    fi
}

download_file $_json_data


