// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "ASE Standard Double-side"
{
	Properties
	{
		[Header(Albedo)][SingleLineTexture]_Albedo("Albedo", 2D) = "white" {}
		_AlbedoColor("Tent Color", Color) = (1,1,1,0)
		[SingleLineTexture]_TentColorMask("Tent Color Mask", 2D) = "black" {}
		_AlbedoColor2("Bed Color", Color) = (1,1,1,0)
		[SingleLineTexture]_BedColorMask("Bed Color Mask", 2D) = "black" {}
		_AlbedoColor1("Chair Color", Color) = (1,1,1,0)
		[SingleLineTexture]_ChairColorMask("Chair Color Mask", 2D) = "black" {}
		_AlbedoColor3("Lanthanum Color", Color) = (1,1,1,0)
		[SingleLineTexture]_LanthanumColorMask("Lanthanum Color Mask", 2D) = "black" {}
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
		uniform sampler2D _TentColorMask;
		uniform float4 _TentColorMask_ST;
		uniform float4 _AlbedoColor;
		uniform sampler2D _ChairColorMask;
		uniform float4 _ChairColorMask_ST;
		uniform float4 _AlbedoColor1;
		uniform sampler2D _BedColorMask;
		uniform float4 _BedColorMask_ST;
		uniform float4 _AlbedoColor2;
		uniform sampler2D _LanthanumColorMask;
		uniform float4 _LanthanumColorMask_ST;
		uniform float4 _AlbedoColor3;
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
			float2 uv_TentColorMask = i.uv_texcoord * _TentColorMask_ST.xy + _TentColorMask_ST.zw;
			float2 uv_ChairColorMask = i.uv_texcoord * _ChairColorMask_ST.xy + _ChairColorMask_ST.zw;
			float2 uv_BedColorMask = i.uv_texcoord * _BedColorMask_ST.xy + _BedColorMask_ST.zw;
			float2 uv_LanthanumColorMask = i.uv_texcoord * _LanthanumColorMask_ST.xy + _LanthanumColorMask_ST.zw;
			float4 Albedo20 = ( tex2D( _Albedo, uv_Albedo ) + ( ( tex2D( _TentColorMask, uv_TentColorMask ) * _AlbedoColor ) + ( tex2D( _ChairColorMask, uv_ChairColorMask ) * _AlbedoColor1 ) + ( tex2D( _BedColorMask, uv_BedColorMask ) * _AlbedoColor2 ) + ( tex2D( _LanthanumColorMask, uv_LanthanumColorMask ) * _AlbedoColor3 ) ) );
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
0;0;1920;1019;1339.779;1880.628;1.918446;True;True
Node;AmplifyShaderEditor.CommentaryNode;19;-751.2005,-1841.603;Inherit;False;1445.269;1753.907;;22;92;95;94;93;90;84;88;91;89;87;86;85;82;4;29;26;24;20;2;7;99;100;Albedo;1,1,1,1;0;0
Node;AmplifyShaderEditor.TexturePropertyNode;26;-687.2005,-1569.603;Inherit;True;Property;_TentColorMask;Tent Color Mask;3;1;[SingleLineTexture];Create;True;0;0;0;False;0;False;12feb01fc70fcdd4baa32cf8f43d9478;12feb01fc70fcdd4baa32cf8f43d9478;False;black;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.TexturePropertyNode;88;-719.2005,-833.6031;Inherit;True;Property;_BedColorMask;Bed Color Mask;5;1;[SingleLineTexture];Create;True;0;0;0;False;0;False;9aca8c1a2e92fb742a43dacf0cd4dc83;9aca8c1a2e92fb742a43dacf0cd4dc83;False;black;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.TexturePropertyNode;84;-703.2005,-1201.603;Inherit;True;Property;_ChairColorMask;Chair Color Mask;7;1;[SingleLineTexture];Create;True;0;0;0;False;0;False;a2c2f16f0b017774a9dd27f6bbff6ecb;a2c2f16f0b017774a9dd27f6bbff6ecb;False;black;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.TexturePropertyNode;92;-719.2005,-465.6028;Inherit;True;Property;_LanthanumColorMask;Lanthanum Color Mask;9;1;[SingleLineTexture];Create;True;0;0;0;False;0;False;ae9c0d0d80038244b8034638a3ecb805;ae9c0d0d80038244b8034638a3ecb805;False;black;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.CommentaryNode;55;-711.9104,1685.489;Inherit;False;1012.763;453.4526;;6;41;45;44;35;49;83;Smoothness;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;53;-718.3469,494.4929;Inherit;False;1026.013;540.1919;;5;16;15;43;14;13;Emission;1,1,1,1;0;0
Node;AmplifyShaderEditor.TexturePropertyNode;49;-689.3092,1897.18;Inherit;True;Property;_Smootness;Smootness;14;2;[Header];[SingleLineTexture];Create;True;1;Smoothness;0;0;False;0;False;None;86ad9ef303584794294525752cc4c9fc;False;black;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.ColorNode;90;-415.2006,-641.6031;Inherit;False;Property;_AlbedoColor2;Bed Color;4;0;Create;False;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;86;-415.2006,-1009.603;Inherit;False;Property;_AlbedoColor1;Chair Color;6;0;Create;False;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;4;-399.2006,-1377.603;Inherit;False;Property;_AlbedoColor;Tent Color;2;0;Create;False;0;0;0;False;0;False;1,1,1,0;1,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;94;-415.2006,-273.6028;Inherit;False;Property;_AlbedoColor3;Lanthanum Color;8;0;Create;False;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;29;-463.2006,-1569.603;Inherit;True;Property;_TextureSample2;Texture Sample 2;1;0;Create;True;0;0;0;False;0;False;7;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;93;-495.2006,-465.6028;Inherit;True;Property;_TextureSample7;Texture Sample 7;1;0;Create;True;0;0;0;False;0;False;7;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;89;-495.2006,-833.6031;Inherit;True;Property;_TextureSample6;Texture Sample 6;1;0;Create;True;0;0;0;False;0;False;7;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;85;-479.2006,-1201.603;Inherit;True;Property;_TextureSample5;Texture Sample 5;1;0;Create;True;0;0;0;False;0;False;7;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.CommentaryNode;54;-714.851,1124.908;Inherit;False;1020.531;457.3368;;5;42;47;34;46;48;Metaric;1,1,1,1;0;0
Node;AmplifyShaderEditor.TexturePropertyNode;48;-681.4627,1333.465;Inherit;True;Property;_Metaric;Metaric;12;2;[Header];[SingleLineTexture];Create;True;1;Metaric;0;0;False;0;False;None;6ed50abb4d191b04daeeb9e2af6b31ee;False;black;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.RangedFloatNode;35;-445.6514,1758.745;Inherit;False;Property;_SmoothnessIntensity;Smoothness Intensity;15;0;Create;True;0;0;0;False;0;False;0;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;56;-721.6761,-3.54129;Inherit;False;880.6624;434.7215;;4;36;12;8;23;Normals;1,1,1,1;0;0
Node;AmplifyShaderEditor.TexturePropertyNode;13;-696.1454,800.5317;Inherit;True;Property;_Emission;Emission;16;2;[Header];[SingleLineTexture];Create;True;1;Emission;0;0;False;0;False;None;345f51150fc18e44398d8526d5f99b25;False;black;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.TexturePropertyNode;7;-719.2005,-1793.603;Inherit;True;Property;_Albedo;Albedo;1;2;[Header];[SingleLineTexture];Create;False;1;Albedo;0;0;False;0;False;None;cc67e5a8571f8184b958a8a51d2d0a56;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;95;-175.2006,-305.6028;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;91;-175.2006,-673.6031;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;82;-159.2006,-1409.603;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;87;-175.2006,-1041.603;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;44;-465.9556,1897.086;Inherit;True;Property;_TextureSample3;Texture Sample 3;5;1;[SingleLineTexture];Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;100;139.3425,-1166.965;Inherit;False;4;4;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;46;-449.0546,1335.995;Inherit;True;Property;_TextureSample4;Texture Sample 4;6;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;12;-697.9953,184.5416;Inherit;True;Property;_Normals;Normals;10;3;[Header];[Normal];[SingleLineTexture];Create;True;1;Normals;0;0;False;0;False;-1;None;263a32dae7778df419ffb03a216cc838;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;34;-438.6977,1203.734;Inherit;False;Property;_MetaricIntensity;Metaric Intensity;13;0;Create;True;0;0;0;False;0;False;0;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;16;-382.097,580.2156;Inherit;False;Property;_EmissionColor;Emission Color;17;1;[HDR];Create;True;0;0;0;False;0;False;1,1,1,0;2.297397,2.036124,1.486551,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;45;-127.9315,1809.029;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;2;-463.2006,-1793.603;Inherit;True;Property;_TextureSample1;Texture Sample 1;1;0;Create;True;0;0;0;False;0;False;7;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;14;-461.6426,802.5571;Inherit;True;Property;_TextureSample0;Texture Sample 0;1;0;Create;True;0;0;0;False;0;False;26;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;8;-697.7589,100.4471;Inherit;False;Property;_NolmalsIntensity;Nolmals Intensity;11;0;Create;True;0;0;0;False;0;False;0;1;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;15;-127.5219,660.8455;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;23;-362.9716,128.2064;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.OneMinusNode;83;41.59766,1809.263;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;47;-136.3745,1262.285;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;99;223.7542,-1404.853;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;36;-114.6903,125.399;Inherit;False;Normals;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;42;65.0757,1255.123;Inherit;False;Metaric;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;41;86.02684,1958.292;Inherit;False;Smoothness;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;20;508.3448,-1197.363;Inherit;False;Albedo;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;43;58.33057,656.7199;Inherit;False;Emission;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;39;754.6685,341.9086;Inherit;False;41;Smoothness;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;40;762.9942,188.4443;Inherit;False;43;Emission;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;24;144.7994,-1697.603;Inherit;False;Property;_AlphaClip;Alpha Clip;0;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;38;762.6356,265.5497;Inherit;False;42;Metaric;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;37;767.1716,112.2646;Inherit;False;36;Normals;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;22;765.2,27.9949;Inherit;False;20;Albedo;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;1045.377,76.0473;Float;False;True;-1;2;ASEMaterialInspector;0;0;Standard;ASE Standard Double-side;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;False;False;False;False;False;False;Off;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;18;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;5;False;-1;10;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;True;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;24;0;0;0;False;0.1;False;-1;0;False;-1;False;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;29;0;26;0
WireConnection;93;0;92;0
WireConnection;89;0;88;0
WireConnection;85;0;84;0
WireConnection;95;0;93;0
WireConnection;95;1;94;0
WireConnection;91;0;89;0
WireConnection;91;1;90;0
WireConnection;82;0;29;0
WireConnection;82;1;4;0
WireConnection;87;0;85;0
WireConnection;87;1;86;0
WireConnection;44;0;49;0
WireConnection;100;0;82;0
WireConnection;100;1;87;0
WireConnection;100;2;91;0
WireConnection;100;3;95;0
WireConnection;46;0;48;0
WireConnection;45;0;35;0
WireConnection;45;1;44;0
WireConnection;2;0;7;0
WireConnection;14;0;13;0
WireConnection;15;0;16;0
WireConnection;15;1;14;0
WireConnection;23;0;8;0
WireConnection;23;1;12;0
WireConnection;83;0;45;0
WireConnection;47;0;34;0
WireConnection;47;1;46;0
WireConnection;99;0;2;0
WireConnection;99;1;100;0
WireConnection;36;0;23;0
WireConnection;42;0;47;0
WireConnection;41;0;83;0
WireConnection;20;0;99;0
WireConnection;43;0;15;0
WireConnection;0;0;22;0
WireConnection;0;1;37;0
WireConnection;0;2;40;0
WireConnection;0;3;38;0
WireConnection;0;4;39;0
ASEEND*/
//CHKSM=D19B2F0C54BB7F07B66464CBF1D71C2543D454E4