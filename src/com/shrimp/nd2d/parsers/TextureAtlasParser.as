package com.shrimp.nd2d.parsers
{
	import com.shrimp.nd2d.assets.AssetLoader;
	import com.shrimp.nd2d.assets.AssetParser;
	import com.shrimp.nd2d.assets.AssetVisitor;
	import com.shrimp.nd2d.constant.AssetType;
	
	import de.nulldesign.nd2d.materials.texture.Texture2D;
	import de.nulldesign.nd2d.materials.texture.TextureAtlas;
	import de.nulldesign.nd2d.materials.texture.parser.ATextureAtlasParser;
	import de.nulldesign.nd2d.materials.texture.parser.TexturePackerParser;
	
	import flash.display.BitmapData;
	
	public class TextureAtlasParser extends AssetParser
	{
		public function TextureAtlasParser()
		{
			super();
		}
		
		protected override function parseData():void
		{
			m_loader = new AssetLoader();
			m_loader.add(info.url + ".xml", AssetType.XML);
			m_loader.add(info.url + ".png", AssetType.BITMAP);
			m_loader.load(loadComplete);
		}
		
		private function loadComplete():void
		{
			var l_arr:Array = info.url.split("_");
			var l_packId:int = l_arr[1];
			
			var l_visitor:AssetVisitor = new AssetVisitor();
			var l_bitmapData:BitmapData = l_visitor.retain(info.url + ".png", AssetType.BITMAP);
		    var l_xml:XML = l_visitor.retain(info.url + ".xml", AssetType.XML);
			
			var l_texture:Texture2D = Texture2D.textureFromBitmapData(l_bitmapData);
			
			//maybe here are some bugs?! sol 2014-07-24
			parseDone(new TextureAtlasAssetData(new TextureAtlas(l_texture.bitmapWidth,l_texture.bitmapHeight, l_xml,new TexturePackerParser(),60)));
			l_visitor.destroy();
		}
		
		private var m_loader:AssetLoader = null;
		
		public static function support(p_type:int):Boolean
		{
			if (AssetType.TEXTUREATLAS == p_type)
			{
				return true;
			}
			else
			{
				return false;
			}
		}		
	}
}
import com.shrimp.nd2d.assets.IAssetData;

import de.nulldesign.nd2d.materials.texture.TextureAtlas;



class TextureAtlasAssetData implements IAssetData
{
	public function TextureAtlasAssetData(p_data:TextureAtlas)
	{
		m_data = p_data;
	}
	
	public function get data():*
	{
		return m_data;
	}
	
	public function destroy():void
	{
		m_data.dispose();
		m_data = null;
	}
	
	private var m_data:TextureAtlas = null;	
}
