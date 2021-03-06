#version 130

#variables

#functions

void main(void)
{
  //works only for orthogonal modelview
  //normal = normalize((modelview_matrix * vec4(in_normal, 0)).xyz);
    

	#include vBase.snip
	
	if(use_alpha)
	{
		v_ss_normal = normalize((modelview_matrix * rotation_matrix * vec4(in_normal, 0)).xyz);
		v_ss_tangent = normalize((modelview_matrix * rotation_matrix * vec4(in_tangent, 0)).xyz);
		v_ss_bnormal = normalize(cross(v_ss_normal, v_ss_tangent));
	}
  	
	v_depth = gl_Position.a;
	
	#include vLightCalc.snip
}