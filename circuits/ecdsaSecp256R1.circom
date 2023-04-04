pragma circom 2.0.2;

include "bigint_func.circom"

template verifySignature(n, k) {
    signal input r[k];
    signal input s[k];
    signal input msghash[k];
    signal input pubkey[2][k];

    var p[100] =  get_secp256r1_prime(n,k);
    var order[100] = get_secp256r1_order(n,k);

    var sinv_comp[100] = mod_inv(n, k, s, order);

}