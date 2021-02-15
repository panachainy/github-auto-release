# Manual Install json

# cd ~/bin
# curl -L https://github.com/trentm/json/raw/master/lib/json.js > json
# chmod 755 json

# == general command =======================================================================================================

sed ':a;N;$!ba;s/\n//g' # for remove new line

# == tree ==================================================================================================================

baseUrl='https://api.github.com/repos/panachainy/github-auto-release/git/trees/develop'
jsonData=`curl -H "Accept: application/vnd.github.v3+json" $baseUrl`

# if tree use this
echo $jsonData | json tree | json -a url

# == content ===============================================================================================================

have_content=`curl https://api.github.com/repos/panachainy/github-auto-release/git/blobs/eb079ffdc682e0868619fda16817bad33afcbd9e`

# if blob use this
echo $have_content | sed ':a;N;$!ba;s/\n//g' | json content
