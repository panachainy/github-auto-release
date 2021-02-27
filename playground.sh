fuction_get_string() {
    echo "parameter: $1 test echo with parameter"
}

function_test_main() {
    result_global=$(fuction_get_string "parameter1")

    echo "=1================================"
    echo $result_global
    echo "================================="

    local result_local
    result_local=$(fuction_get_string "parameter2")
    echo "=2================================"
    # FIXME: can't assign result to local variable.
    echo $result_local
    echo "================================="
}

function_test_main
