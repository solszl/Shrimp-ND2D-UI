package com.shrimp.nd2d.ui.core
{
	import com.shrimp.nd2d.utils.ClassUtils;
	
	import flash.geom.Rectangle;
	
	public class TextureUIVo
	{
		public var packId:int;
		public var region:Rectangle;
		
		public function TextureUIVo()
		{
			super();
		}
		
		public function toString():String
		{
			return ClassUtils.varDump(this,"");
		}
	}
}