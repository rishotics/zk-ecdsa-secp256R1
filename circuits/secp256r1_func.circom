function get_secp256r1_prime(n, k) {
     assert((n == 86 && k == 3) || (n == 64 && k == 4));
     var ret[100];
     
     if (n == 64 && k == 4) {
         ret[0] = 18446744073709551615;
         ret[1] = 4294967295;
         ret[2] = 0;
         ret[3] = 18446744069414584321;
     }
     return ret;
}

function get_secp256r1_order(n, k) {
    assert((n == 86 && k == 3) || (n == 64 && k == 4));
    var ret[100];
    
    if (n == 64 && k == 4) {
        ret[0] = 17562291160714782033;
        ret[1] = 13611842547513532036;
        ret[2] = 18446744073709551615;
        ret[3] = 18446744069414584320;
    }
    return ret;
}