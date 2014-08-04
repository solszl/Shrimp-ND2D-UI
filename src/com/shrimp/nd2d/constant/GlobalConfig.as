package com.shrimp.nd2d.constant
{

	/**
	 *	全局常量类
	 * @author Sol
	 *
	 */
	public class GlobalConfig
	{
		public function GlobalConfig()
		{
		}
		
		/**	全局缩放系数,该系数再程序初始化的时候.根据舞台宽高以及纹理大小得出*/
		public static var scaleFactor:Number=1.0;
		
		/**	默认全屏宽*/
		public static const TextureDefaultWIDTH:int = 512;
		/**	默认全屏高*/
		public static const TextureDefaultHEIGHT:int = 768;
		
	}
}
