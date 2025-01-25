# # Create image file of specified size
# # REQ: dd
# function touch-mb-img
#     if ! string length -q $argv
#         echo 'usage: touch-md-img [NUM x 1024bytes] [PATH]'
#         return 1
#     end

#     dd if=/dev/urandom of=$avgv[2] count=$argv[1] bs=1024
# end
