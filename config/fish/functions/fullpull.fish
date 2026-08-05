function fullpull --description "git pull all direct subdirectories"
  if [ (count $argv) -gt 0 ]
    set dir "$argv[1]"
  else
    set dir "."
  end
  for d in $dir/*/
    if ! [ -d "$d/.git" ]; and ! [ -e "$d/HEAD" ]
      continue
    end
    echo (set_color yellow)"=> $d"(set_color normal)
    git -C "$d" pull > /dev/null
    set branch $(git -C "$d" branch --show-current)
    if ! contains $branch main master
      echo (set_color red)"Warning: $d is on branch "(set_color cyan)"$branch"(set_color red)"."(set_color normal)
    end
  end
end
