#include "../math/map.hlsl"

/*
original_author: Kathy McGuiness
description: |
    Returns a gear shaped SDF
    Some notes about the parameters:
        * b determines the length and roundness of the spokes
        * n is the number of spokes 
use: gearSDF(<float2> st, <float> b, <int> n_spokes)
examples:
    - https://gist.githubusercontent.com/kfahn22/84ded9666e6037fdb62376ccffb6582e/raw/14bd8fb7911b0dc5aec635357693e21fdda512bc/gear.frag
*/

#ifndef FNC_GEARSDF
#define FNC_GEARSDF
float gearSDF( float2 st, float b, int N ) 
    float e = 2.71828182845904523536;
    st = st * 2.0 - 1.0;
    float s = map(b, 1.0, 15.0, 0.066, 0.5);
    float d = length(st) - s;
    float omega = b * sin(float(N)*atan(st.y, st.x));
    float l = pow(e, 2.0 * omega);
    float hyperTan = (l - 1.0) / (l + 1.0);
    float r = (1.0/b)*hyperTan;
    return d + min(d, r);
}
#endif