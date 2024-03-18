// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "ASE Standard Double-side"
{
	Properties
	{
		[Header(Albedo)][SingleLineTexture]_Albedo("Albedo", 2D) = "white" {}
		_AlbedoColor("Albedo Color", Color) = (1,1,1,0)
		[SingleLineTexture]_AlbedoColorMask("Albedo Color Mask", 2D) = "black" {}
		[Header(Normals)][Normal][SingleLineTexture]_Normals("Normals", 2D) = "bump" {}
		_NolmalsIntensity("Nolmals Intensity", Range( -1 , 1)) = 0
		[Header(Metaric)][SingleLineTexture]_Metaric("Metaric", 2D) = "black" {}
		_MetaricIntensity("Metaric Intensity", Range( 0 , 1)) = 0
		[Header(Smoothness)][SingleLineTexture]_Smootness("Smootness", 2D) = "black" {}
		_SmoothnessIntensity("Smoothness Intensity", Range( 0 , 1)) = 0
		[Header(Emission)][SingleLineTexture]_Emission("Emission", 2D) = "black" {}
		[HDR]_EmissionColor("Emission Color", Color) = (1,1,1,0)
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" "IgnoreProjector" = "True" "IsEmissive" = "true"  }
		Cull Off
		CGPROGRAM
		#pragma target 3.0
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform float _NolmalsIntensity;
		uniform sampler2D _Normals;
		uniform float4 _Normals_ST;
		uniform sampler2D _Albedo;
		uniform float4 _Albedo_ST;
		uniform sampler2D _AlbedoColorMask;
		uniform float4 _AlbedoColorMask_ST;
		uniform float4 _AlbedoColor;
		uniform float4 _EmissionColor;
		uniform sampler2D _Emission;
		uniform float4 _Emission_ST;
		uniform float _MetaricIntensity;
		uniform sampler2D _Metaric;
		uniform float4 _Metaric_ST;
		uniform float _SmoothnessIntensity;
		uniform sampler2D _Smootness;
		uniform float4 _Smootness_ST;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float2 uv_Normals = i.uv_texcoord * _Normals_ST.xy + _Normals_ST.zw;
			float3 Normals36 = ( _NolmalsIntensity * UnpackNormal( tex2D( _Normals, uv_Normals ) ) );
			o.Normal = Normals36;
			float2 uv_Albedo = i.uv_texcoord * _Albedo_ST.xy + _Albedo_ST.zw;
			float2 uv_AlbedoColorMask = i.uv_texcoord * _AlbedoColorMask_ST.xy + _AlbedoColorMask_ST.zw;
			float4 blendOpSrc77 = tex2D( _Albedo, uv_Albedo );
			float4 blendOpDest77 = ( tex2D( _AlbedoColorMask, uv_AlbedoColorMask ) * _AlbedoColor );
			float4 Albedo20 = ( saturate( ( 1.0 - ( 1.0 - blendOpSrc77 ) * ( 1.0 - blendOpDest77 ) ) ));
			o.Albedo = Albedo20.rgb;
			float2 uv_Emission = i.uv_texcoord * _Emission_ST.xy + _Emission_ST.zw;
			float4 Emission43 = ( _EmissionColor * tex2D( _Emission, uv_Emission ) );
			o.Emission = Emission43.rgb;
			float2 uv_Metaric = i.uv_texcoord * _Metaric_ST.xy + _Metaric_ST.zw;
			float4 Metaric42 = ( _MetaricIntensity * tex2D( _Metaric, uv_Metaric ) );
			o.Metallic = Metaric42.r;
			float2 uv_Smootness = i.uv_texcoord * _Smootness_ST.xy + _Smootness_ST.zw;
			float4 Smoothness41 = ( 1.0 - ( _SmoothnessIntensity * tex2D( _Smootness, uv_Smootness ) ) );
			o.Smoothness = Smoothness41.r;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=18921
2026;64;1920;1019;986.4023;-1230.263;1;True;True
Node;AmplifyShaderEditor.CommentaryNode;19;-805.5238,-721.3129;Inherit;False;1316.474;639.5477;;8;77;4;29;24;2;26;7;20;Albedo;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;55;-711.9104,1685.489;Inherit;False;1012.763;453.4526;;6;41;45;44;35;49;83;Smoothness;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;54;-714.851,1124.908;Inherit;False;1020.531;457.3368;;5;42;47;34;46;48;Metaric;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;53;-718.3469,494.4929;Inherit;False;1026.013;540.1919;;5;16;15;43;14;13;Emission;1,1,1,1;0;0
Node;AmplifyShaderEditor.TexturePropertyNode;26;-747.5509,-443.6779;Inherit;True;Property;_AlbedoColorMask;Albedo Color Mask;3;1;[SingleLineTexture];Create;True;0;0;0;False;0;False;None;None;False;black;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.TexturePropertyNode;49;-689.3092,1897.18;Inherit;True;Property;_Smootness;Smootness;8;2;[Header];[SingleLineTexture];Create;True;1;Smoothness;0;0;False;0;False;None;86ad9ef303584794294525752cc4c9fc;False;black;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.SamplerNode;44;-465.9556,1897.086;Inherit;True;Property;_TextureSample3;Texture Sample 3;5;1;[SingleLineTexture];Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TexturePropertyNode;7;-769.6035,-671.2891;Inherit;True;Property;_Albedo;Albedo;1;2;[Header];[SingleLineTexture];Create;False;1;Albedo;0;0;False;0;False;None;cc67e5a8571f8184b958a8a51d2d0a56;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.SamplerNode;29;-520.1743,-441.8717;Inherit;True;Property;_TextureSample2;Texture Sample 2;1;0;Create;True;0;0;0;False;0;False;7;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TexturePropertyNode;48;-681.4627,1333.465;Inherit;True;Property;_Metaric;Metaric;6;2;[Header];[SingleLineTexture];Create;True;1;Metaric;0;0;False;0;False;None;6ed50abb4d191b04daeeb9e2af6b31ee;False;black;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.TexturePropertyNode;13;-696.1454,800.5317;Inherit;True;Property;_Emission;Emission;10;2;[Header];[SingleLineTexture];Create;True;1;Emission;0;0;False;0;False;None;cc67e5a8571f8184b958a8a51d2d0a56;False;black;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.CommentaryNode;56;-721.6761,-3.54129;Inherit;False;880.6624;434.7215;;4;36;12;8;23;Normals;1,1,1,1;0;0
Node;AmplifyShaderEditor.ColorNode;4;-446.7001,-248.2999;Inherit;False;Property;_AlbedoColor;Albedo Color;2;0;Create;False;0;0;0;False;0;False;1,1,1,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;35;-445.6514,1758.745;Inherit;False;Property;_SmoothnessIntensity;Smoothness Intensity;9;0;Create;True;0;0;0;False;0;False;0;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;34;-438.6977,1203.734;Inherit;False;Property;_MetaricIntensity;Metaric Intensity;7;0;Create;True;0;0;0;False;0;False;0;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;45;-127.9315,1809.029;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;82;-167.7654,-324.4397;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;12;-697.9953,184.5416;Inherit;True;Property;_Normals;Normals;4;3;[Header];[Normal];[SingleLineTexture];Create;True;1;Normals;0;0;False;0;False;-1;None;263a32dae7778df419ffb03a216cc838;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;14;-461.6426,802.5571;Inherit;True;Property;_TextureSample0;Texture Sample 0;1;0;Create;True;0;0;0;False;0;False;26;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;46;-449.0546,1335.995;Inherit;True;Property;_TextureSample4;Texture Sample 4;6;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;8;-697.7589,100.4471;Inherit;False;Property;_NolmalsIntensity;Nolmals Intensity;5;0;Create;True;0;0;0;False;0;False;0;1;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;2;-513.6969,-665.2776;Inherit;True;Property;_TextureSample1;Texture Sample 1;1;0;Create;True;0;0;0;False;0;False;7;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;16;-382.097,580.2156;Inherit;False;Property;_EmissionColor;Emission Color;11;1;[HDR];Create;True;0;0;0;False;0;False;1,1,1,0;0,0,0,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.OneMinusNode;83;41.59766,1809.263;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;23;-362.9716,128.2064;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;47;-136.3745,1262.285;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;15;-127.5219,660.8455;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.BlendOpsNode;77;-48.56282,-420.2384;Inherit;False;Screen;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;43;58.33057,656.7199;Inherit;False;Emission;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;36;-114.6903,125.399;Inherit;False;Normals;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;42;65.0757,1255.123;Inherit;False;Metaric;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;20;248.5746,-349.2846;Inherit;False;Albedo;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;41;86.02684,1958.292;Inherit;False;Smoothness;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;24;98.56224,-569.9716;Inherit;False;Property;_AlphaClip;Alpha Clip;0;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;37;767.1716,112.2646;Inherit;False;36;Normals;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;38;762.6356,265.5497;Inherit;False;42;Metaric;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;39;754.6685,341.9086;Inherit;False;41;Smoothness;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;40;762.9942,188.4443;Inherit;False;43;Emission;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;22;772.2124,4.639069;Inherit;False;20;Albedo;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;1045.377,76.0473;Float;False;True;-1;2;ASEMaterialInspector;0;0;Standard;ASE Standard Double-side;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;False;False;False;False;False;False;Off;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;True;Opaque;;Geometry;All;18;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;5;False;-1;10;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;True;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;24;0;0;0;False;0.1;False;-1;0;False;-1;False;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;44;0;49;0
WireConnection;29;0;26;0
WireConnection;45;0;35;0
WireConnection;45;1;44;0
WireConnection;82;0;29;0
WireConnection;82;1;4;0
WireConnection;14;0;13;0
WireConnection;46;0;48;0
WireConnection;2;0;7;0
WireConnection;83;0;45;0
WireConnection;23;0;8;0
WireConnection;23;1;12;0
WireConnection;47;0;34;0
WireConnection;47;1;46;0
WireConnection;15;0;16;0
WireConnection;15;1;14;0
WireConnection;77;0;2;0
WireConnection;77;1;82;0
WireConnection;43;0;15;0
WireConnection;36;0;23;0
WireConnection;42;0;47;0
WireConnection;20;0;77;0
WireConnection;41;0;83;0
WireConnection;0;0;22;0
WireConnection;0;1;37;0
WireConnection;0;2;40;0
WireConnection;0;3;38;0
WireConnection;0;4;39;0
ASEEND*/
//CHKSM=4C79BD57C96A606F38B83D3E9D53C3F06E4623EF