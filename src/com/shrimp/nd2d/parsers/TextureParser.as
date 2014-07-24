package com.shrimp.nd2d.parsers
{
	import com.shrimp.nd2d.assets.AssetParser;
	import com.shrimp.nd2d.constant.AssetType;
	
	import flash.display.Bitmap;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.net.URLRequest;
	
	/**
	 * ...
	 * @author mm
	 */
	public class TextureParser extends AssetParser
	{
		public function TextureParser() 
		{
			super();
		}
		
		protected override function dispose():void
		{
			m_loader.unload();
			m_loader = null;
		}
		
		protected override function parseData():void
		{
			m_loader = new Loader();
			m_loader.contentLoaderInfo.addEventListener(Event.COMPLETE, loadComplete);
			m_loader.load(new URLRequest(info.url));
		}		
		
		private function loadComplete(p_event:Event):void
		{
			parseDone(new TextureAssetData(Bitmap(m_loader.content).bitmapData));
		}
		
		private var m_loader:Loader = null;
		
		public static function support(p_type:int):Boolean
		{
			if (AssetType.TEXTURE == p_type)
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

import de.nulldesign.nd2d.materials.texture.Texture2D;

import flash.display.BitmapData;

class TextureAssetData implements IAssetData
{
	public function TextureAssetData(p_data:BitmapData)
	{
		m_data = Texture2D.textureFromBitmapData(p_data);
		p_data.dispose();
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
	
	private var m_data:Texture2D = null;
}