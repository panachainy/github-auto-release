get_data() {
    echo $(curl -H "Accept: application/vnd.github.v3+json" $1)
}

remove_new_line() {
    echo $(echo $1 | sed ':a;N;$!ba;s/\n//g')
}

write_file_from_blob_type() {
    removed_line_data=$(remove_new_line "$1")
    echo $removed_line_data | json content | base64 -d >$2
}

# url / type / path
directory_process() {
    current_json_data=$(get_data "$1")
    removed_line_data=$(remove_new_line "$current_json_data")

    if [ "$2" = "tree" ]; then

        types=$(echo $removed_line_data | json tree | json -a type)
        paths=$(echo $removed_line_data | json tree | json -a path)
        urls=$(echo $removed_line_data | json tree | json -a url)

        current_remove_new_line=$removed_line_data

        count=0
        for i in $types; do
            current_object=$(echo $current_remove_new_line | json tree | json $count)

            url=$(echo $current_object | json url)
            type=$(echo $current_object | json type)
            path=$(echo $current_object | json path)

            echo "========="
            echo $type
            echo $path
            echo $url
            echo "========="

            count=$(($count + 1))
        done
    elif [ "$2" = "blob" ]; then
        write_file_from_blob_type "$1" "$3"
    fi
}

directory_process "https://api.github.com/repos/panachainy/github-auto-release/git/trees/develop" "tree"
