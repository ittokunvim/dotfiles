# make test image file
function create_test_img
  if string length -q $argv
    dd if=/dev/urandom of=$2 count=$1 bs=1024
  else
    echo 'usage: create_test_img [NUMBER x 1024bytes] [PATH]'
  end
end
