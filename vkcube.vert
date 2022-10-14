#version 320 es
// #version 420 core

// vec4 vertices[3] = vec4[3](
//     vec4(0.5f, -0.5f, 0.0f, 1.0f),
//     vec4(0.0f,  0.5f, 0.0f, 1.0f)
//     vec4(-0.5f, -0.5f, 0.0f, 1.0f),
// );

// vec4 lightSource = vec4(2.0, 2.0, 20.0, 0.0);

// layout(location = 0) out vec4 vVaryingColor;

layout (location = 0) in vec4 posOff;

void main()
{
    int id = gl_VertexIndex;
    float idf = float(id) - 1.0f;
    gl_Position = vec4(idf * 0.5f, idf * idf - 0.5, 0.0f, 1.0f) + posOff;
    // vVaryingColor = vec4(idf * 0.5f + 0.5f, idf * idf, 0.0f, 1.0f);
}
