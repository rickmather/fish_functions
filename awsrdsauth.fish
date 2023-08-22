# generate RDS credentials and copies password to the clipboard
# gets the RDS proxy that matches the text supplied in the first parameter (e.g. dev) and generates creds
# example usage: awsrdsauth dev postgres
function awsrdsauth
    set -l PATTERN $argv[1]
    set -l USERNAME $argv[2]

    set -l PROXY_ENDPOINT (aws rds describe-db-proxies --region eu-west-1 --query "DBProxies[?contains(DBProxyName, `$PATTERN`)].Endpoint" --output text)

    if test -z $PROXY_ENDPOINT
        echo "No RDS proxy found matching '$PATTERN'. Are you signed into the right environment?"
    else
        echo "Generating temporary RDS credentials for: $PROXY_ENDPOINT"

        aws rds generate-db-auth-token --hostname $PROXY_ENDPOINT --port 5432 --region eu-west-1 --username $USERNAME | pbcopy
        echo "Password copied to clipboard"
    end
end

