package com.shrimp.nd2d.ui.core
{
	import com.shrimp.nd2d.ClassUtils;
	
	import de.nulldesign.nd2d.materials.texture.Texture2D;
	
	import flash.display.BitmapData;
	import flash.geom.Rectangle;

	public class TexturePackVo
	{
		public var bitmap:BitmapData;
		public var texture:Texture2D;
		public var usedRectangles:Vector.<Rectangle>;
		public var freeRectangles:Vector.<Rectangle>;
		
		public function TexturePackVo()
		{
			super();
		}
		
		public function toString():String
		{
			return ClassUtils.varDump(this,"");
		}
	}
}