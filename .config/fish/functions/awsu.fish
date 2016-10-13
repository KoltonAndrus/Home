function awsu
    set url ubuntu@$argv[1]
    ssh -i ~/.ssh/ec2-test.pem $url
end
