
export uniform int width() { return programCount; }


export void f_f(uniform float RET[], uniform float aFOO[]) {
    #pragma ignore warning(perf)
    float x = aFOO[programIndex&0x3];
    float d, ix;
    ix = rcp_fast(x);
    d = (ix - 1. / x);
    float ix_ = rcp_fast(x);
    float d_ = (ix_ - 1. / x);
    d = (d < 0) ? -d : d;
    RET[programIndex] = (d < 1e-2) ? 1. : 0.;
}

export void result(uniform float RET[]) {
    RET[programIndex] = 1.;
}
