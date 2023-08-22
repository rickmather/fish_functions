function awssh
  set --erase AWS_VAULT
  set --erase AWS_ACCESS_KEY_ID
  set --erase AWS_SECRET_ACCESS_KEY
  set --erase AWS_SESSION_TOKEN
  set --erase AWS_SECURITY_TOKEN
  set --erase AWS_SESSION_EXPIRATION

  aws-vault exec $argv -- /opt/homebrew/bin/fish --login
end
