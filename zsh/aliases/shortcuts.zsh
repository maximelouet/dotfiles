# Saumon ZSH aliases
# Shortcuts

coverfetch () {
  (
    cd ~/git/coverfetch
    nvm use > /dev/null 2>&1
    eval $(op signin)
    PTPIMG_APIKEY=$(op item get "PTPimg API key" --fields=password)
    if [ ${#PTPIMG_APIKEY} -ne 36 ]; then
      >&2 echo "Warning: could not get PTPIMG_APIKEY from 1Password, not uploading"
      npm start --silent -- $@
    fi
    export PTPIMG_APIKEY
    npm start --silent -- -u $@
  )
}
