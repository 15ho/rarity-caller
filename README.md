# Rarity Caller

## Build
```shell
SECRETFILE=<your secret file path> truffle build
```

## Deploy
```shell
SECRETFILE=<your secret file path> truffle deploy --network fantom

# Or

SECRETFILE=<your secret file path> truffle migrate --network fantom
```

## Approve
1. [Rarity#setApprovalForAll](https://ftmscan.com/address/0xce761d788df608bd21bdd59d6f4b54b2e27f25bb#writeContract)
2. RarityCaller#approve_all