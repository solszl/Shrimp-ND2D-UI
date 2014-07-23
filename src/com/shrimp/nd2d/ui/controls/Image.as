package com.shrimp.nd2d.ui.controls
{
	import com.shrimp.nd2d.ui.core.Component;
	
	import de.nulldesign.nd2d.display.Node2D;
	import de.nulldesign.nd2d.display.Sprite2D;
	import de.nulldesign.nd2d.materials.texture.Texture2D;
	
	import flash.display.BitmapData;
	import flash.display3D.textures.Texture;

	/**
	 *	图像 
	 * @author Sol
	 * 
	 */	
	public class Image extends Sprite2D
	{
		public function Image(parent:Node2D=null, xpos:Number=0, ypos:Number=0)
		{
//			super(parent,xpos,ypos);
		}
		
		private var _source:Object;
		public function set source(value:Object):void
		{
			if(_source == value)
			{
				return;
			}
			
			if(value is Texture2D)
			{
				
			}
			else if(value is Texture)
			{
				
			}
			else if(value is Class)
			{
				
			}
			else if(value is BitmapData)
			{
				
			}
			else if(value is String)
			{
				
			}
			invalidateColors			
		}
		
		override public function dispose():void
		{
			super.dispose();
		}
	}
}