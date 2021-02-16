remove_new_line(){
    _remove_new_line_tmp=`echo $1 | sed ':a;N;$!ba;s/\n//g'`
}

write_file_from_blob_type(){
    remove_new_line "$1"
    echo $_remove_new_line_tmp | json content | base64 -d > $2
}

_have_content=`curl https://api.github.com/repos/panachainy/github-auto-release/git/blobs/eb079ffdc682e0868619fda16817bad33afcbd9e`

write_file_from_blob_type "$_have_content" "c.txt"
