#version 420 core

layout(std140, set = 0, binding = 0) uniform block {
    uniform mat4 modelviewMatrix;
    uniform mat4 modelviewprojectionMatrix;
    uniform mat3 normalMatrix;
};

layout(location = 0) in vec4 in_position;
layout(location = 1) in vec4 in_color;
layout(location = 2) in vec3 in_normal;

vec4 lightSource = vec4(2.0, 2.0, 20.0, 0.0);

layout(location = 0) out vec4 vVaryingColor;

void main()
{
    int id = gl_VertexIndex;
    float idf = float(id) - 1.0f;
    vec4 pos = vec4(idf * 0.5f, idf * idf - 0.5, 0.0f, 1.0f);
    gl_Position = pos;
    // if (idf > 0) return;
    //gl_Position = modelviewprojectionMatrix * in_position;
    //gl_Position = in_position + vec4(0.0, 0.0, 0.0, 1.0);
    // vVaryingColor = normalMatrix * in_position;

    vec3 vEyeNormal = normalMatrix * in_normal;
    vec4 vPosition4 = modelviewMatrix * in_position;
    vec3 vPosition3 = vPosition4.xyz / vPosition4.w;
    vec3 vLightDir = normalize(lightSource.xyz - vPosition3);
    float diff = max(0.0, dot(vEyeNormal, vLightDir));
    vVaryingColor = vec4(in_color.xyz, 1.0);
    //vVaryingColor = vec4(diff * in_normal.rgb, 1.0);
}
