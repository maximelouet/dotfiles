

coverfetch () {
  (
    cd ~/git/coverfetch
    nvm use > /dev/null 2>&1
    PTPIMG_APIKEY=$(bw get item 03a8bc65-e029-4b67-b9d4-af5a00ae55f2 | jq -r '.login.password' 2>&1)
    if [ ${#PTPIMG_APIKEY} -ne 36 ]; then
      >&2 echo "Warning: could not get PTPIMG_APIKEY from Bitwarden, not uploading"
      npm start --silent -- $@
    fi
    export PTPIMG_APIKEY
    npm start --silent -- -u $@
  )
}
