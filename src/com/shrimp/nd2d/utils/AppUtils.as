package com.shrimp.nd2d.utils
{
	import com.shrimp.nd2d.constant.GlobalConfig;
	
	import flash.display.Stage;
	import flash.system.Capabilities;

	public class AppUtils
	{
		public function AppUtils()
		{
		}
		
		/**
		 *	根据舞台宽高 计算出缩放比例 
		 * @param stage
		 * 
		 */		
		public static function ScreenInit(stage:Stage):void
		{
//			480*800
//			640*960
			
			trace(stage.fullScreenWidth/GlobalConfig.TextureDefaultWIDTH,stage.fullScreenHeight/GlobalConfig.TextureDefaultHEIGHT);
			
			trace("fullScreen",stage.fullScreenWidth,stage.fullScreenHeight);
			
			trace("Screen",stage.stageWidth,stage.stageHeight);
			
			trace("screenResolution:",Capabilities.screenResolutionX,Capabilities.screenResolutionY);
			
			var scaleW:Number = stage.fullScreenWidth/GlobalConfig.TextureDefaultWIDTH;
			var scaleH:Number = stage.fullScreenHeight/GlobalConfig.TextureDefaultHEIGHT;
			GlobalConfig.scaleFactor = Math.min(scaleW,scaleH);
			
			trace("Gloable Scale factor:",GlobalConfig.scaleFactor);
		}
		
		public static function getOS():String
		{
			var str:String = flash.system.Capabilities.os.toLowerCase();
			
			if(str.indexOf("windows")>=0)
			{
				return "AIR";	
			}
			else if(str.indexOf("mac")>=0)
			{
				return "iOS";
			}
			else if(str.indexOf("linux")>=0)
			{
				return "Android";
			}
			else
			{
				return "unkonwn";
			}
		}
	}
}