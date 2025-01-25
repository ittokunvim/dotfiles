# Send JSON request
# REQ: curl
function curl-json
    if ! string length -q $argv[3]
        echo "usage: curl-json [Method] [URL] [DATA] [OPTIONS...]"
		return 1
    end

    curl $argv[2] -X $argv[1] -H 'Content-Type: application/json' -d $argv[3] $argv[4..-1]
end
