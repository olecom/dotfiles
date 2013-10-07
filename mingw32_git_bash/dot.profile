echo "
This is dot profile settings for MINGW32 GIT BaSH

ssh-agent: check and or run
ssh-add: github key
"
SA=`ps aux | sed -n /ssh-agent/p`
if [ "$SA" ]
then
    echo "Active ssh-agent:
$SA
Reading ~/.ssh/agent_setup:
"
    . ~/.ssh/agent_setup
else
    echo "No ssh-agent found. Run new, write ~/.ssh/agent_setup:"
    ssh-agent.exe -s >~/.ssh/agent_setup
    . ~/.ssh/agent_setup
    echo 'New ssh-agent:'
    ps aux | sed -n /ssh-agent/p
    echo 'Add key:'
    ssh-add.exe ~/.ssh/github_rsa
fi
