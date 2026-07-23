function _ls_on_dir_change --on-variable PWD --description "list directory contents upon changing directory"
  status --is-command-substitution; and return
  ls
end
