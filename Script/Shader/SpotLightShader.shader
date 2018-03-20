Shader "Custom/CameraEffect/SpotLightShader"
{
	Properties
	{
		_MainTex ("Texture", 2D) = "white" {}
		_Param ("Param(Center.x, Center.y, a, b)", vector ) = ( 0.5, 0.5, 1.0, 1.0 )//Center.x, Center.y, a,b
	}
	SubShader
	{

		Pass
		{
			CGPROGRAM
			#include "UnityCG.cginc"

			#pragma vertex vert
			#pragma fragment frag
			
			sampler2D	_MainTex;
			float4		_Param;
	
			struct appdata
			{
				float4 vertex : POSITION;
				float2 uv : TEXCOORD0;
			};

			struct v2f
			{
				float2 uv : TEXCOORD0;
				float4 vertex : SV_POSITION;
			};

			v2f vert (appdata v)
			{
				v2f o;
				o.vertex = UnityObjectToClipPos(v.vertex);
				o.uv = v.uv;
				return o;
			}
			


			fixed4 frag (v2f i) : SV_Target
			{
				fixed4 col = tex2D(_MainTex, i.uv);
				fixed4 black = float4(0.0, 0.0, 0.0, 1.0);

				// Elipse equation
				// ((x-p)/a)^2 + ((y-q)/b)^2 = 1
				//
				float r = (i.uv.x - _Param.x)*(i.uv.x - _Param.x)/_Param.z/_Param.z+
				(i.uv.y - _Param.y)*(i.uv.y - _Param.y)/_Param.w/_Param.w;

				// r^2 < 1 ? Original : Black
				return lerp(col, black, floor(r) );
			}
			ENDCG
		}
	}
}
