# SpotLightShader
- 画面の特定の円領域を表示するエフェクトです。
- スポットライトを当てたような演出ができます。（007 の冒頭シーンみたいな感じです）

~ Eng ~
- This Effect let visiable in circle area.
- This Effect looks like spot light effect such as Opening in 007(movie).


## 実装について( About implementation )
- ポストエフェクト(ポストプロセス)を用いたエフェクトです。
- RenderTextureを利用するもののため処理が重めです。
- モバイルでも動作可能です(Xperia Z1 で検証)
	- もしかしたら特定のAndroid で用いているGPUだとダメかもしれないです。そのときはすみません。


~ Eng ~
- This Effect uses PosrEffect( PostProcess ).
- Performance is a little bit bad because using PostEffect( PostProcess ).
- This Effect can be used with MobilePhone
	- With Xperia Z1, this effect goes well.
	- Some GPU used in Android may not goes well... sorry...

## 使い方( How to use )
1. カメラに「PostCameraEffect.cs」をアタッチ
2. PostCameraEffect.cs のTargetMaterial に「TestMaterial.mat」がアタッチされているか確認
3. Unity を再生


~ Eng ~
1. Attach "PostCameraEffect" script to Camera Object.
2. Check PostCameraEffect Component which is attached "TestMaterial".
3. Play Unity

## ShaderParameter
- Param.x : 円の中心位置のx座標( 正規化したもの)
- Param.y : 円の中心位置のy座標( 正規化したもの)
- Param.z : 楕円のx軸方向の倍率( 0除算を防ぐため0の入力は避けてください )
- Param.w : 楕円のy軸方向の倍率( 0除算を防ぐため0の入力は避けてください )


~ Eng ~
- Param.x : Normalized Center X-axis Position of Circle(Elipse).
- Param.y : Normalized Center Y-axis Position of Circle(Elipse).
- Param.z : Scale of X-Axis of Elipse
- Param.w : Scale of Y-Axis of Elipse


