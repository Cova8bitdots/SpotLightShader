using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PostCameraEffect : MonoBehaviour
{
	[SerializeField]
	Material TargetMaterial;


	private void OnRenderImage(RenderTexture src, RenderTexture dest)
	{
		Graphics.Blit( src, dest, TargetMaterial );
	}

}
