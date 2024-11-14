## THE REPOSITORY IS ONLY FOR TEST and NON-PRODUCTION use-cases

guys, please read the line above one more time

# HOW TO

It's the most simple deployment of web3signer which can sign your eth1 transactions with provided keys.

1. Generate keystores:

e.g:
```bash
geth account new --keystore ./keystores
```

you will need to rename password file so it has the same name as a keystore.json
see keystores directory for config example

2. Boot it up!

```bash
docker compose up
```

that's it! you may call your web3signer on http://localhost:9000

Please consult with https://docs.web3signer.consensys.io/ 
and again
use it only for testing purposes!


```log
web3signer-1  | 2024-11-14 12:06:08.246+00:00 | main | INFO  | Web3SignerApp | Web3Signer has started with args --config-file=/config/config.yaml,--key-store-path=/web3signer/keystores,eth1,--chain-id=9496
web3signer-1  | 2024-11-14 12:06:08.250+00:00 | main | INFO  | Web3SignerApp | Version = web3signer/v24.6.0/linux-aarch_64/-eclipseadoptium-openjdk64bitservervm-java-17
web3signer-1  | 2024-11-14 12:06:08.542+00:00 | pool-2-thread-1 | INFO  | SignerLoader | Loading signer configuration metadata files from /web3signer/keystores
web3signer-1  | 2024-11-14 12:06:08.549+00:00 | pool-2-thread-1 | INFO  | SignerLoader | Signer configuration metadata files read in memory 1 in 00:00:00.003
web3signer-1  | 2024-11-14 12:06:08.573+00:00 | pool-2-thread-1 | INFO  | SignerLoader | Converting signing metadata to Artifact Signer using parallel streams ...
web3signer-1  | 2024-11-14 12:06:09.231+00:00 | pool-2-thread-1 | INFO  | SignerLoader | Total Artifact Signer loaded via configuration files: 1
web3signer-1  | Error count 0
web3signer-1  | Time Taken: 00:00:00.682.
web3signer-1  | 2024-11-14 12:06:09.233+00:00 | pool-2-thread-1 | INFO  | DefaultArtifactSignerProvider | Total signers (keys) currently loaded in memory: 1
web3signer-1  | 2024-11-14 12:06:09.312+00:00 | main | INFO  | Runner | Web3Signer has started with TLS disabled, and ready to handle signing requests on 0.0.0.0:9000
```
