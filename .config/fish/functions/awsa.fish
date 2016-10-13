function awsa
    set url ec2-user@$argv[1]
    ssh -i ~/.ssh/ec2-test.pem $url
end
