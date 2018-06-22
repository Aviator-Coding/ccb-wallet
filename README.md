# <h1>CCB - Wallet
## Dockercontainer for CCB Wallet

Run Container:
>```docker run --name ccb-masternode-01 --restart=always -d --net mn_net -p xxx.xxx.xxx.xxx:19551:19551 -p xxx.xxx.xxx.xx:19552:19552  -v /masternode/ccb_01/.cryptocashback:/root/.cryptocashback aviator86/ccb-wallet```

> /masternode/ccb_01/.cryptocashback - is the location where you store your config on the host  
--name  ccb-masternode-01 - is the tag which will show up in the Container list name it whatever you want

Stoping Container:
>```docker stop ccb-masternode-01```

Restart Container:
>```docker restart ccb-masternode-01```

Start Container:
>```docker start ccb-masternode-01```

Delete Container: Need to stop Container First
>```docker rm ccb-masternode-01```

See Container Logs:
>```docker logs ccb-masternode-01```

## Wallet Status inside Container
See CCB Chain Status:
>```docker exec -it ccb-masternode-01 cryptocashback-cli getinfo```

See CCB Chain Masternode Status:
>```docker exec -it ccb-masternode-01 cryptocashback-cli masternode status```