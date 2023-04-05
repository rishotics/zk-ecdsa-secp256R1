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

    signal sinv[k];
    component sinv_range_checks[k];
    for (var idx=0; idx<k; idx++){
        sinv[idx] <-- sinv_comp[idx];
        sinv_range_checks[idx] = Num2Bits(n);
        sinv_range_checks[idx].in <== sinv[idx];
    }

    component sinv_check = BigMultModP(n, k);
    for (var idx=0; idx<k; idx++){
        sinv_check.a[idx] <== sinv[idx];
        sinv_check.b[idx] <== s[idx];
        sinv_check.p[idx] <== order[idx];
    }

    for (var idx=0; idx<k; idx++){
        if(idx == 0){
            sinv_check.c[idx] === 1;
    }
        if(idx > 0){
            sinv_check.c[idx] === 0;
        }
    }

    // h * s^-1 mod n 
    component g_coeff = BigMultModP(n, k);
    for (var idx = 0; idx < k; idx++) {
        g_coeff.a[idx] <== sinv[idx];
        g_coeff.b[idx] <== msghash[idx];
        g_coeff.p[idx] <== order[idx];
    }

}