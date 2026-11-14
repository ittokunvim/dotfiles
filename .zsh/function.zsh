#  _____ _   _ _   _  ____ _____ ___ ___  _   _
# |  ___| | | | \ | |/ ___|_   _|_ _/ _ \| \ | |
# | |_  | | | |  \| | |     | |  | | | | |  \| |
# |  _| | |_| | |\  | |___  | |  | | |_| | |\  |
# |_|    \___/|_| \_|\____| |_| |___\___/|_| \_|

# make test image file
create_test_img() {
  dd if=/dev/urandom of=$2 count=$1 bs=1024

  if [ $? -gt 0 ]; then
    echo 'usage: create_test_img [NUMBER x 1024bytes] [PATH]'
  fi
}
