#version 320 es
// #version 420 core

// layout(location = 0) in highp vec4 vVaryingColor;
layout(location = 0) out highp vec4 f_color;

layout(set = 0, binding = 0) uniform block {
    highp vec4 colour;
};

void main()
{
    f_color = vec4(gl_FragCoord.x / 256.0f, gl_FragCoord.y / 256.0f, 0, 1);
    // f_color = vec4(1.0f, 0.0f, 0, 1);
}
