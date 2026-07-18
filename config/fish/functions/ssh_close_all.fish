function ssh_close_all --description "terminate all SSH ControlMaster connections"
    for sock in /tmp/ssh-control-*
        ssh -o ControlPath=$sock -O exit squalala
    end
end
