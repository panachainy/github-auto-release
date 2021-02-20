fuction_get_string() {
    echo "$1 asdasd;lqwkdjqwpodajksdasd"
}

function_test_main() {
    result_global=$(fuction_get_string "asd")

    echo "================================="
    echo $result_global
    echo "================================="

    local result_local=$(echo $result_global)
    echo "================================="
    echo $result_global
    # FIXME: can't assign result to local variable.
    echo $result_local
    echo "================================="
}

function_test_main
