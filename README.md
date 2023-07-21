# zk-SNARK, that prover knows the signature of the message

> The project was made for educational purposes.

`PoseidonSignatureVerifier` circuit verify that the prover knows the signature of the message.

Circuit works with messages of arbitrary length, which can be specified as a parameter.

## Start

In `input.json` is the set of the inputs:

- message: initial data (array of arbitrary length)
- pubkey: the public key of the account that signed the message (Ax, Ay)
- signature: (R8x, R8y, S)

Run to test default setup:

```shell
npm run start
```

Or following command to change some of the input file:

```shell
sh run.sh <circuit name> <input file name>
```
