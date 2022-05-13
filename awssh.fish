function awssh
  set --erase AWS_VAULT
  set --erase AWS_ACCESS_KEY_ID
  set --erase AWS_SECRET_ACCESS_KEY
  set --erase AWS_SESSION_TOKEN
  set --erase AWS_SECURITY_TOKEN
  set --erase AWS_SESSION_EXPIRATION

  set AWS_ACCOUNT_ID $argv
  
  aws-vault exec "$AWS_ACCOUNT_ID" -- /opt/homebrew/bin/fish --login
end
