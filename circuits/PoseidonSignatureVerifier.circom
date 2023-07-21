pragma circom 2.0.0;

include "../node_modules/circomlib/circuits/poseidon.circom";
include "../node_modules/circomlib/circuits/eddsaposeidon.circom";

template PoseidonSignatureVerifier(length) {
    signal input message[length];

    signal input pubkey[2];
    signal input signature[3];

    // Get poseidon hash from message
    component p = Poseidon(length);
    for (var i = 0; i < length; i++) p.inputs[i] <== message[i];

    // Verify sig
    component verifier = EdDSAPoseidonVerifier();

    verifier.enabled <== 1;

    verifier.Ax <== pubkey[0];
    verifier.Ay <== pubkey[1];

    verifier.R8x <== signature[0];
    verifier.R8y <== signature[1];
    verifier.S <== signature[2];

    verifier.M <== p.out;
}

component main { public [message, pubkey] } = PoseidonSignatureVerifier(2);