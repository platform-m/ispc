
export uniform int width() { return programCount; }


export void f_fu(uniform float RET[], uniform float aFOO[], uniform float b) {
    float a = aFOO[programIndex];
    uniform float i;
    float r = 0.;
    #pragma ignore warning
    cfor (i = 0; i < b; ++i)
        r += a;
    RET[programIndex] = r;
}


export void result(uniform float RET[]) {
    RET[programIndex] = 5 + 5 * programIndex;
}
