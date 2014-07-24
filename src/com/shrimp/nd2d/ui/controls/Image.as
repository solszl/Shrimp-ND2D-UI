package com.shrimp.nd2d.ui.controls
{
	import com.shrimp.nd2d.assets.AssetVisitor;
	import com.shrimp.nd2d.constant.AssetType;
	import com.shrimp.nd2d.ui.core.Component;
	
	import de.nulldesign.nd2d.display.Node2D;
	import de.nulldesign.nd2d.display.Sprite2D;
	import de.nulldesign.nd2d.materials.Sprite2DMaterial;
	import de.nulldesign.nd2d.materials.texture.Texture2D;
	import de.nulldesign.nd2d.utils.TextureHelper;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display3D.textures.Texture;
	import flash.geom.Point;

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
			super();
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
				texture = value as Texture2D;
			}
			else if(value is Class)
			{
				var b:Bitmap = new value() as Bitmap;
				texture = Texture2D.textureFromBitmapData(b.bitmapData);
			}
			else if(value is BitmapData)
			{
				texture = Texture2D.textureFromBitmapData(value as BitmapData);
			}
			else if(value is String)
			{
				var bmd:BitmapData = getTextureByImageName(value as String)
				texture = Texture2D.textureFromBitmapData(bmd);
			}
			
			setTexture(texture);
			setMaterial(new Sprite2DMaterial());
			pivot = new Point(-texture.bitmapWidth>>1,-texture.bitmapHeight>>1);
		}
		
		override public function dispose():void
		{
			super.dispose();
		}
		
		protected function getTextureByImageName(p_imageName:String, p_type:int=AssetType.BITMAP):BitmapData
		{
			var l_visitor:AssetVisitor=new AssetVisitor();
			var l_texture:BitmapData;
			if (AssetVisitor.has(p_imageName, p_type))
			{
				l_texture=l_visitor.retain(p_imageName, p_type);
			}
			else
			{
				throw new Error("can not find texture by image name:", p_imageName);
			}
			
			l_visitor.destroy();
			l_visitor=null;
			
			return l_texture;
		}
	}
}